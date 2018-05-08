<?php

namespace Bzh\CoreBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Bzh\CoreBundle\Entity\Clan;
use Bzh\CoreBundle\Services\GetDatasClashOfClans;
use Symfony\Component\HttpFoundation\Request;
use Bzh\CoreBundle\Form\ClanMembersUpdateType;
use Bzh\CoreBundle\Form\ClanRulesType;

class CoreController extends Controller
{
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $repWar = $em->getRepository("BzhWarBundle:War");
        $wars = $repWar->getCurrentWars();
        
        /* @var $repClan \Bzh\CoreBundle\Repository\ClanRepository */
        $repClan = $em->getRepository("BzhCoreBundle:Clan");
        $clans = $repClan->findByType(1, array('slug' => 'ASC'));
        
        return $this->render('BzhCoreBundle:Core:index.html.twig', array(
            'wars' => $wars,
            'clans'=> $clans
        ));
    }
    
    public function mapAction()
    {
        return $this->render('BzhCoreBundle:Core:map.html.twig', array(
        ));
    }
    
    public function clanAction(Clan $clan)
    {
        /* @var $service GetDatasClashOfClans */
        $service = $this->get('api.clash');
        
        return $this->render('BzhCoreBundle:Core:clan.html.twig', array(
            'clan' => $clan,
            'json' => $service->GetClan($clan->getTag())
        ));
    }
    
    public function membersAction(Clan $clan)
    {
        $em = $this->getDoctrine()->getManager();
        $rep = $em->getRepository("BzhCoreBundle:Player");/* @var $rep \Bzh\CoreBundle\Repository\PlayerRepository */
        $members = $rep->getPlayers($clan, false);
        $olders = $rep->getPlayers($clan, true);
        
        $grades = array(
            'leader' => 'Chef',
            'coLeader' => 'Chef adjoint',
            'admin' => 'Ainé',
            'member' => 'Membre'
        );
        
        return $this->render('BzhCoreBundle:Core:members.html.twig', array(
            'clan' => $clan,
            'members' => $members,
            'olders' => $olders,
            'grades' => $grades
        ));
    }
    
    public function membersUpdateAction(Clan $clan, Request $request) {
        $em = $this->getDoctrine()->getManager();
        
        $form = $this->createForm(ClanMembersUpdateType::class, $clan);
        if ($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
            $em->flush();
        }
        
        return $this->render('BzhCoreBundle:Core:members_update.html.twig', array(
            'clan' => $clan,
            'form' => $form->createView(),
        ));
    }
    
    public function warlogAction(Clan $clan)
    {
        $em = $this->getDoctrine()->getManager();
        /* @var $repWar \Bzh\WarBundle\Repository\WarRepository */
        $repWar = $em->getRepository("BzhWarBundle:War");
        $wars = $repWar->getPastWars($clan);        
        
        $cwin = 0;
        $cnul = 0;
        $cloo = 0;
        foreach ($wars as $w) {
            /* @var $w \Bzh\WarBundle\Entity\War */
            switch ($w->getResult()) {
                case 'V':
                    $cwin++;
                    break;
                case 'N':
                    $cnul++;
                    break;
                case 'D':
                    $cloo++;
                    break;
            }
        }
        
        return $this->render('BzhCoreBundle:Core:warlog.html.twig', array(
            'clan' => $clan,
            'wars' => $wars,
            'cwin' => $cwin,
            'cnul' => $cnul,
            'cloo' => $cloo,
        ));
    }
    
    public function statsAction(Clan $clan) {
        
        $em = $this->getDoctrine()->getManager();
        /* @var $repWar \Bzh\WarBundle\Repository\WarRepository */
        $repWar = $em->getRepository("BzhWarBundle:War");
        $stats = $repWar->getStatsPastWars($clan);
        
        return $this->render('BzhCoreBundle:Core:stats.html.twig', array(
            'clan' => $clan,
            'stats' => $stats
        ));
    }
    
    public function rulesAction(Clan $clan, Request $request) {
      $em = $this->getDoctrine()->getManager();
      $form = $this->get('form.factory')->create(ClanRulesType::class, $clan, array(
        'action' => $this->generateUrl('clan_rules', array('slug' => $clan->getSlug()))
      ));
      if ($request->isMethod('POST') && $form->handleRequest($request)->isValid()) {
        $em->flush();
      }
      return $this->render('BzhCoreBundle:Core:rules.html.twig', array(
        'form'=> $form->createView(),
        'clan' => $clan
      ));
    }
    
    public function matchmakingAction() {
        return $this->render('BzhCoreBundle:Core:matchmaking.html.twig', array(
        ));
    }
}
