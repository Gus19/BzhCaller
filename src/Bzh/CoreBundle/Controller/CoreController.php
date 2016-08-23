<?php

namespace Bzh\CoreBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Bzh\CoreBundle\Entity\Clan;
use Bzh\CoreBundle\Services\GetDatasClashOfClans;
//use Symfony\Component\Finder\Finder;

class CoreController extends Controller
{
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $repWar = $em->getRepository("BzhWarBundle:War");
        $wars = $repWar->getCurrentWars();
        
        /* @var $repClan \Bzh\CoreBundle\Repository\ClanRepository */
        $repClan = $em->getRepository("BzhCoreBundle:Clan");
        $clans = $repClan->findByType(1);
        
        return $this->render('BzhCoreBundle:Core:index.html.twig', array(
            'wars' => $wars,
            'clans'=> $clans
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
        
        //return $this->json($service->GetClanMembers($clan->getTag()));
        
        return $this->render('BzhCoreBundle:Core:members.html.twig', array(
            'clan' => $clan,
            'json' => $service->GetClanMembers($clan->getTag())
        ));
    }
    
    public function warlogAction(Clan $clan)
    {
        /* @var $service GetDatasClashOfClans
        $service = $this->get('api.clash');
        
        $finder = new Finder();
        $finder->files()->in($this->get('kernel')->getRootDir() . "/../var/jsonclash")->name('*.json');
        foreach ($finder as $file) {
            $test = $data = json_decode($file->getContents(), true);
        }
        
        return $this->render('BzhCoreBundle:Core:warlog.html.twig', array(
            'clan' => $clan,
            'json' => $service->GetClanWarLog($clan->getTag()),
            'files'=> $finder,
            'test' => $test
        ));*/
        
        $em = $this->getDoctrine()->getManager();
        $repWar = $em->getRepository("BzhWarBundle:War");
        $wars = $repWar->getPastWars($clan);
        
        return $this->render('BzhCoreBundle:Core:warlog.html.twig', array(
            'clan' => $clan,
            'wars' => $wars
        ));
    }
    
    public function statsAction(Clan $clan) {
        return $this->render('BzhCoreBundle:Core:stats.html.twig', array(
            'clan' => $clan
        ));
    }
    
    

}
