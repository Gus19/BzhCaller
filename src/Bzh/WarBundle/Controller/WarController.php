<?php

namespace Bzh\WarBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Bzh\WarBundle\Entity\War;
use Bzh\WarBundle\Entity\Target;
use Bzh\WarBundle\Entity\Attack;
use Bzh\CoreBundle\Entity\Clan;
use Bzh\WarBundle\Repository\WarRepository;
use Bzh\WarBundle\Repository\TargetRepository;
use Bzh\WarBundle\Form\WarType;
use Bzh\CoreBundle\Form\ClanDescriptionType;
use Bzh\WarBundle\Form\TargetCommentType;
use Bzh\WarBundle\Form\TargetAttackType;

class WarController extends Controller
{
    
    public function codeAction($code, Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $rep = $em->getRepository("BzhWarBundle:War"); /* @var $rep WarRepository */
        $war = $rep->findOneByCode($code); /* @var $war War */
        
        if($war == null) {
            $request->getSession()->getFlashBag()->add('error', 'Impossible de trouver la guerre correspondante au code "' . $code . '"');
            return $this->redirectToRoute('home');
        }
        
        $repTarget = $em->getRepository("BzhWarBundle:Target"); /* @var $rep TargetRepository */
        $targets = $repTarget->findTargetsAndAttacksByWar($war);
        
        $service = $this->get('war.dates.calc');
        
        $form = $this->get('form.factory')->create(TargetCommentType::class, new Target());
        $formAtt = $this->get('form.factory')->create(TargetAttackType::class, new Attack());
        
        return $this->render('BzhWarBundle:War:code.html.twig', array(
            'war' => $war,
            'timeBejoreStart' => $service->calcTimeBeforeStart($war->getDateStart()),
            'timeBejoreEnd' => $service->calcTimeBeforeEnd($war->getDateEnd()),
            'targets' => $targets,
            'form' => $form->createView(),
            'formAtt' => $formAtt->createView()
        ));
    }
    
    public function clanDescriptionAction(War $war, Request $request) {
        $em = $this->getDoctrine()->getManager();
        $formClanDescription = $this->get('form.factory')->create(ClanDescriptionType::class, $war->getBzhClan(), array(
            'action' => $this->generateUrl('war_clan_description', array('code' => $war->getCode()))
            //'method' => 'GET'
        ));
        if ($request->isMethod('POST') && $formClanDescription->handleRequest($request)->isValid()) {
            $em->flush();
            return $this->redirectToRoute('war_code', array(
                'code' => $war->getCode()
            ));
        }
        return $this->render('BzhWarBundle:War:clanDescription.html.twig', array(
            'war' => $war,
            'description' => $formClanDescription->createView()
        ));
    }
    
    public function targetCommentAction(Target $target, Request $request) {
        //En commentaire pour l'ajax
        $em = $this->getDoctrine()->getManager();
        $form = $this->get('form.factory')->create(TargetCommentType::class, $target, array(
            //'action' => $this->generateUrl('war_target_comment', array('id' => $target->getId()))
        ));
        if ($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
            $em->flush();
            return $this->redirectToRoute('war_code', array(
                'code' => $target->getWar()->getCode()
            ));
        }
        /*return $this->render('BzhWarBundle:War:targetComment.html.twig', array(
            'target' => $target,
            'form' => $form->createView()
        ))*/
    }
    
    public function targetAttackAction(Target $target, Request $request) {
        //En commentaire pour l'ajax
        $em = $this->getDoctrine()->getManager();
        $attack = new Attack();
        $form = $this->get('form.factory')->create(TargetAttackType::class, $attack, array(
            //'action' => $this->generateUrl('war_target_attack', array('id' => $target->getId()))
        ));
        if ($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
            $attack->setTarget($target);
            $em->persist($attack);
            $em->flush();
            
            return $this->redirectToRoute('war_code', array(
                'code' => $target->getWar()->getCode()
            ));
        }
        return $this->render('BzhWarBundle:War:dump.html.twig', array(
            'attack' => $attack
        ));
    }
    
    public function newAction(Request $request) {
        $em = $this->getDoctrine()->getManager();
        
        $war = new War();
        $form = $this->get('form.factory')->create(WarType::class, $war);
        $form->get('timeChoice')->setData('start');
        
        if ($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
            $timeChoice = $form->get('timeChoice')->getData();
            $timeTo = $form->get('timeTo')->getData();/* @var $timeTo \DateTime */
            $serviceDates = $this->get('war.dates.calc');
            
            $vsClan = new Clan();
            $war->setCode(substr(md5(uniqid(rand(), true)),0, 4));
            $war->setDateStart($serviceDates->calcDateStart($timeChoice, $timeTo));
            $war->setDateEnd($serviceDates->calcDateEnd($timeChoice, $timeTo));
            $vsClan->setName($form->get('vsClanText')->getData());
            $vsClan->setLevel($form->get('vsClanLevel')->getData());
            $vsClan->setTag($form->get('vsClanTag')->getData());
            $vsClan->setType(2);
            $war->setVsClan($vsClan);
            
            $em->persist($vsClan);
            $em->persist($war);
            
            $service = $this->get('war.targets.create');
            $service->generate($war, $war->getSize());
            
            $em->flush();

            $request->getSession()->getFlashBag()->add('info', 'Guerre bien enregistrée (code = '.$war->getCode().').');

            return $this->redirectToRoute('war_code', array(
                'code' => $war->getCode()
            ));
        }
        
        return $this->render('BzhWarBundle:War:new.html.twig', array(
            'form' => $form->createView()
        ));
    }
    
    public function editAction(War $war, Request $request) {
        $em = $this->getDoctrine()->getManager();
        $form = $this->get('form.factory')->create(WarType::class, $war);
        
        $vsClan = $war->getVsClan();
        $now = new \Datetime();
        
        if($now < $war->getDateStart()) {
            $form->get('timeChoice')->setData('start');
            $diff = date_diff($now, $war->getDateStart());
            $form->get('timeTo')->setData( $war->getDateStart()->setTime(0, 0, 0)->add($diff) );
        }
        elseif ($now < $war->getDateEnd()) {
            $form->get('timeChoice')->setData('end');
            $diff = date_diff($now, $war->getDateEnd());
            $form->get('timeTo')->setData( $war->getDateEnd()->setTime(0, 0, 0)->add($diff) );
        }
        else {
            $request->getSession()->getFlashBag()->add('info', 'Impossible de modifier une guerre terminée');
            return $this->redirectToRoute("war_code", array(
                'code' => $war->getCode()
            ));
        }
        
        $form->get('vsClanText')->setData( $vsClan->getName() );
        $form->get('vsClanLevel')->setData( $vsClan->getLevel() );
        $form->get('vsClanTag')->setData( $vsClan->getTag() );
        
        if ($request->isMethod('POST')) {
            // Avant que l'objet soit hydraté
            $size = $war->getSize();
            
            if($form->handleRequest($request)->isValid()) {
                if($size != $war->getSize()) {
                    $service = $this->get('war.targets.create');
                    $service->generate($war, $war->getSize());
                }
                
                $timeChoice = $form->get('timeChoice')->getData();
                $timeTo = $form->get('timeTo')->getData();/* @var $timeTo \DateTime */
                $serviceDates = $this->get('war.dates.calc');
                $war->setDateStart($serviceDates->calcDateStart($timeChoice, $timeTo));
                $war->setDateEnd($serviceDates->calcDateEnd($timeChoice, $timeTo));
                
                $vsClan->setName($form->get('vsClanText')->getData());
                $vsClan->setLevel($form->get('vsClanLevel')->getData());
                $vsClan->setTag($form->get('vsClanTag')->getData());
                $em->flush();
                
                return $this->redirectToRoute('war_code', array(
                    'code' => $war->getCode()
                ));
            }
        }
        
        return $this->render('BzhWarBundle:War:edit.html.twig', array(
            'war' => $war,
            'form' => $form->createView()
        ));
    }
    
    public function deleteAction(War $war, Request $request) {
        $em = $this->getDoctrine()->getManager();
        
        $code = $war->getCode();
        
        $em->remove($war);
        $em->flush();
        
        $request->getSession()->getFlashBag()->add('info', 'Guerre bien supprimée (code = '.$code.').');
        
        return $this->redirectToRoute('home');
    }
}
