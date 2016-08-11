<?php

namespace Bzh\CoreBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

use Bzh\CoreBundle\Repository\ClanRepository;
use Bzh\CoreBundle\Entity\Clan;
use Bzh\CoreBundle\Services\GetDatasClashOfClans;

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
        /* @var $service GetDatasClashOfClans */
        $service = $this->get('api.clash');
        return $this->render('BzhCoreBundle:Core:members.html.twig', array(
            'clan' => $clan,
            'json' => $service->GetClanMembers($clan->getTag())
        ));
    }

}
