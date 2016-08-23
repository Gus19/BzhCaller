<?php
namespace Bzh\WarBundle\Services;

use Doctrine\ORM\EntityManager;
use Bzh\WarBundle\Entity\War;
use Bzh\WarBundle\Entity\Target;
use Bzh\WarBundle\Repository\TargetRepository;

class CreateTargets {
    
    private $em;

    public function __construct(EntityManager $entityManager)
    {
        $this->em = $entityManager;
    }
    
    public function generate(War $war, $number) {
        /* @var $rep TargetRepository */
        $rep = $this->em->getRepository("BzhWarBundle:Target");
        if($war->getId()) {
            $targets = $rep->deleteByWar($war);
        }
        
        for ($index = 1; $index <= $number; $index++) {
            $target = new Target();
            $target->setPosition($index);
            $target->setHdv(1);
            $target->setWar($war);
            $this->em->persist($target);
        }
    }
}