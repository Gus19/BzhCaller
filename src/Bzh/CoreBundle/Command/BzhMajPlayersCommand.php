<?php

namespace Bzh\CoreBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

class BzhMajPlayersCommand extends ContainerAwareCommand
{
    protected function configure()
    {
        $this
            ->setName('bzh:maj:players')
            ->setDescription('Mise à jour des joueurs des clans BZH')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $service = $this->getContainer()->get('api.clash'); /* @var $service \Bzh\CoreBundle\Services\GetDatasClashOfClans */
        $em = $this->getContainer()->get('doctrine')->getEntityManager(); /* @var $em \Doctrine\ORM\EntityManager */
        $repClan = $em->getRepository("BzhCoreBundle:Clan"); /* @var $repClan \Bzh\CoreBundle\Repository\ClanRepository */
        $repPlayer = $em->getRepository("BzhCoreBundle:Player"); /* @var $repPlayer \Bzh\CoreBundle\Repository\PlayerRepository */
        
        $clans = $repClan->findByType(1);
        foreach ($clans as $clan) { /* @var $clan \Bzh\CoreBundle\Entity\Clan */
            $output->writeln("Recherche pour le clan " . $clan->getName() . " - " . $clan->getTag());
            
            $repPlayer->setOldAllPlayers($clan, 1);
            
            $clanApi = json_decode(json_encode($service->GetClanMembers($clan->getTag())), True); //Pour transformer les stdClass en Array
            foreach ($clanApi["items"] as $value) {
                $output->writeln("    " . $value["name"] . " - " . $value["tag"]);
                $playerApi = json_decode(json_encode($service->GetPlayer($value["tag"])), True);
                
                $player = $repPlayer->findOneByTag($value["tag"]);
                if($player == null) {
                    $player = new \Bzh\CoreBundle\Entity\Player();
                    $player->setTag($playerApi["tag"]);
                    $em->persist($player);
                }
                $player->setClan($clan);
                $player->setName($playerApi["name"]);
                $player->setHdv($playerApi["townHallLevel"]);
                $player->setOld(0);
                $player->setExpLevel($playerApi["expLevel"]);
                $player->setWarStars($playerApi["warStars"]);
                $player->setRole($playerApi["role"]);
                $em->flush();
            }
        }
        
    }

}
