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
use Bzh\WarBundle\Repository\AttackRepository;
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
    
    public function targetCommentAction($id, Request $request) {
        $em = $this->getDoctrine()->getManager();
        
        $rep = $em->getRepository("BzhWarBundle:Target"); /* @var $rep TargetRepository */
        $target = $rep->findCommentById($id); /* @var $war War */
        
        $form = $this->get('form.factory')->create(TargetCommentType::class, $target, array(
            'action' => $this->generateUrl('war_target_comment', array('id' => $target->getId()))
        ));
        if ($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
            $em->flush();
            return $this->redirectToRoute('war_code', array(
                'code' => $target->getWar()->getCode()
            ));
        }
        return $this->render('BzhWarBundle:War:targetComment.html.twig', array(
            'target' => $target,
            'form' => $form->createView()
        ));
    }
    
    public function targetAttackAction(Target $target, Request $request) {
        //En commentaire pour l'ajax
        $em = $this->getDoctrine()->getManager();
        $attack = new Attack();
        $form = $this->get('form.factory')->create(TargetAttackType::class, $attack, array(
            //'action' => $this->generateUrl('war_target_attack', array('id' => $target->getId()))
        ));
        $rep = $em->getRepository("BzhWarBundle:Attack"); /* @var $rep AttackRepository */
        if ($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
            $attack->setTimerStart($rep->findMaxDateStartByTarget($target));
            $attack->setTimerEnd($rep->findMaxDateEndByTarget($target));
            $attack->setTarget($target);
            $em->persist($attack);
            $em->flush();
            
            return $this->redirectToRoute('war_code', array(
                'code' => $target->getWar()->getCode()
            ));
        }
        
        throw new \Symfony\Component\HttpKernel\Exception\NotFoundHttpException();
    }
    
    public function newAction(Request $request) {
        $em = $this->getDoctrine()->getManager();
        
        $war = new War();
        $form = $this->get('form.factory')->create(WarType::class, $war);
        
        if ($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
            $serviceDates = $this->get('war.dates.calc');
            $war->setCode($this->get('war.code.new')->generate());
            $war->setDateStart($serviceDates->calcDateStart($war->getTimeChoice(), $war->getTimeTo()));
            $war->setDateEnd($serviceDates->calcDateEnd($war->getTimeChoice(), $war->getTimeTo()));
            $em->persist($war);
            
            $service = $this->get('war.targets.create');
            $service->generate($war, $war->getSize());
            
            $em->flush();

            $request->getSession()->getFlashBag()->add('info', 'Guerre bien enregistrée. Code : '.$war->getCode());

            return $this->redirectToRoute('war_code', array(
                'code' => $war->getCode()
            ));
        }
        else {
            $form->get('timeChoice')->setData('start');
        }
        
        return $this->render('BzhWarBundle:War:new.html.twig', array(
            'form' => $form->createView()
        ));
    }
    
    public function editAction(War $war, Request $request) {
        $em = $this->getDoctrine()->getManager();
        
        if(new \Datetime() > $war->getDateEnd()) {
            $request->getSession()->getFlashBag()->add('info', 'Impossible de modifier une guerre terminée');
            return $this->redirectToRoute("war_code", array(
                'code' => $war->getCode()
            ));
        }
        else {
            $war->setTimeToAndTimeChoise();
            $form = $this->get('form.factory')->create(WarType::class, $war);
            $size = $war->getSize();
        }
        
        if ($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
            if($size != $war->getSize()) {
                $this->get('war.targets.create')->generate($war, $war->getSize());
            }

            $serviceDates = $this->get('war.dates.calc');
            $war->setDateStart($serviceDates->calcDateStart($war->getTimeChoice(), $war->getTimeTo()));
            $war->setDateEnd($serviceDates->calcDateEnd($war->getTimeChoice(), $war->getTimeTo()));

            $em->flush();

            return $this->redirectToRoute('war_code', array(
                'code' => $war->getCode()
            ));
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

    public function deleteAttackAction($code, Attack $attack, Request $request) {
        $em = $this->getDoctrine()->getManager();
        
        $name = $attack->getName();
        $postion = $attack->getTarget()->getPosition();
        
        $em->remove($attack);
        $em->flush();
        
        $request->getSession()->getFlashBag()->add('info', 'La réservation de '.$name.' sur la cible '.$postion.' a été supprimée');
        
        return $this->redirectToRoute('war_code', array(
            'code' => $code
        ));
    }
    
    public function editAttackAction($code, Attack $attack, Request $request) {
        $em = $this->getDoctrine()->getManager();
        $form = $this->get('form.factory')->create(TargetAttackType::class, $attack);
        
        if ($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
            $em->flush();

            return $this->redirectToRoute('war_code', array(
                'code' => $code
            ));
        }
        throw new \Symfony\Component\HttpKernel\Exception\NotFoundHttpException();
    }
    
    
}
