<?php

namespace Bzh\CoreBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

use CoreBundle\Repository\ClanRepository;

class CoreController extends Controller
{
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        /* @var $repclan ClanRepository */
        $repClan = $em->getRepository("BzhCoreBundle:Clan");
        $clans = $repClan->findByType(1);
        
        return $this->render('BzhCoreBundle:Core:index.html.twig', array(
            'clans' => $clans
        ));
    }
    
    public function playersAction()
    {
        return $this->render('BzhCoreBundle:Core:players.html.twig', array(
            // ...
        ));
    }

}
