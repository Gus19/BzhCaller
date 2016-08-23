<?php

namespace Bzh\WarBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Bzh\WarBundle\Entity\War;
use Bzh\WarBundle\Entity\Target;
use Bzh\CoreBundle\Entity\Clan;
use Bzh\WarBundle\Repository\WarRepository;
use Bzh\WarBundle\Repository\TargetRepository;
use Bzh\WarBundle\Form\WarType;
use Bzh\CoreBundle\Form\ClanDescriptionType;

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
        
        $formClanDescription = $this->get('form.factory')->create(ClanDescriptionType::class, $war->getBzhClan());
        if ($request->isMethod('POST') && $formClanDescription->handleRequest($request)->isValid()) {
            $em->flush();
        }
        
        $repTarget = $em->getRepository("BzhWarBundle:Target"); /* @var $rep TargetRepository */
        $targets = $repTarget->findByWar($war, array("position"=>"asc"));
        
        $service = $this->get('war.dates.calc');
        
        return $this->render('BzhWarBundle:War:code.html.twig', array(
            'war' => $war,
            'timeBejoreStart' => $service->calcTimeBeforeStart($war->getDateStart()),
            'timeBejoreEnd' => $service->calcTimeBeforeEnd($war->getDateEnd()),
            'description' => $formClanDescription->createView(),
            'targets' => $targets
        ));
    }
    
    public function newAction(Request $request)
    {
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
        
        $form->get('timeChoice')->setData('end');
        $form->get('timeTo')->setData(new \Datetime());
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
