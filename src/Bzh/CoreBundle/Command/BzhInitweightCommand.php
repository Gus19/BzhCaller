<?php

namespace Bzh\CoreBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

class BzhInitweightCommand extends ContainerAwareCommand
{
    protected function configure()
    {
        $this
            ->setName('bzh:initweight')
            ->setDescription('...')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $em = $this->getContainer()->get('doctrine')->getManager(); /* @var $em \Doctrine\ORM\EntityManager */
        $repPlayer = $em->getRepository("BzhCoreBundle:Player"); /* @var $repPlayer \Bzh\CoreBundle\Repository\PlayerRepository */
        
        //update compte xub jr
        $xub = $repPlayer->findOneByTag("#98CQL80QL");
        if($xub != null) {
            $xub->setForceName(true);
            $xub->setName("xubakka-junior");
        }
        
        $weights = array(
            'frere norris'=>107,
            'denez'=>89,
            'JouGe.56'=>88,
            'flo'=>87,
            'Super VegeDave'=>87,
            'patt'=>86,
            'King PHE'=>83,
            'Sergio'=>81,
            'Gil2 latourette'=>70,
            '...Diabolesse..'=>69,
            'jibe79'=>69,
            'PaPa PeUcH'=>69,
            'tristan'=>69,
            'KiKi Le PiRatE'=>69,
            'titouanjanis'=>68,
            'Marin'=>67,
            'juleswarz'=>67,
            'jule'=>67,
            'anael'=>66,
            'xubakka'=>66,
            'Evan'=>66,
            'neguess52'=>64,
            'sylvain'=>64,
            'helbrecht l'=>64,
            'XERCES'=>63,
            'mikke'=>63,
            'Gus'=>60,
            'ju'=>56,
            'DIAMOND DOG'=>54,
            'Sonic Bibou'=>54,
            'cogbzh'=>53,
            'Ferrara'=>49,
            'Eric L\'Ancien'=>46,
            'p\'tit denez'=>42,
            'bidou'=>40,
            'kheldar-junior'=>36
        );
        foreach ($weights as $key => $value) {
            $player = $repPlayer->findOneByName($key);/* @var $player \Bzh\CoreBundle\Entity\Player */
            if($player == null) {
                $this->logError($output, $key . " not exits");
            }
            else {
                $player->setWeight($value);
                $this->logInfo($output, $key . " mis à jour");
            }
        }
        $em->flush();        
    }
    
    private function logInfo($output, $msg) {
        $output->writeln("<info>". date("Y-m-d H:i:s") ."</info> " . $msg);
    }
    private function logError($output, $msg) {
        $output->writeln("<error>". date("Y-m-d H:i:s") ."</error> " . $msg);
    }

}
