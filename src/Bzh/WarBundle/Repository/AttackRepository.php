<?php

namespace Bzh\WarBundle\Repository;

use Bzh\WarBundle\Entity\Target;
use Bzh\WarBundle\Entity\Attack;

class AttackRepository extends \Doctrine\ORM\EntityRepository
{
    public function findMaxDateStartByTarget(Target $target) {
        $qb = $this->createQueryBuilder('a');
        $qb->where('a.target = :target');
        $qb->setParameter('target', $target);
        $qb->orderBy('a.timerEnd', 'DESC');
        $qb->setMaxResults(1);
        $attack = $qb->getQuery()->getOneOrNullResult(); /* @var $attack Attack */
        
        // obligé de passer une new datetime, sinon le add et le setTime de 
        // findMaxDateEndByTarget modifie aussi cette date
        $d = new \DateTime();
        
        if($attack == null && $d < $target->getWar()->getDateStart()) {
            return $d->setTimestamp($target->getWar()->getDateStart()->getTimestamp());
        }
        else if($attack != null && $attack->getDateResult() == null) {
            return $d->setTimestamp($attack->getTimerEnd()->getTimestamp());
        }
        
        return $d;
    }
    public function findMaxDateEndByTarget(Target $target) {
        $qb = $this->createQueryBuilder('a');
        $qb->where('a.target = :target');
        $qb->setParameter('target', $target);
        $qb->orderBy('a.timerEnd', 'DESC');
        $qb->setMaxResults(1);
        $attack = $qb->getQuery()->getOneOrNullResult(); /* @var $attack Attack */
        
        $d = new \DateTime();
        
        if($attack == null && $d < $target->getWar()->getDateStart()) {
            $end = $target->getWar()->getDateEnd();
            $start = $target->getWar()->getDateStart();
            if($start->format('G') < 12) {
                return $start->setTime(12, 00, 00);
            }
            else {
                return $end->setTime(12, 00, 00);
            }
        }
        else if($attack != null && $attack->getDateResult() == null) {
            return $attack->getTimerEnd()->add(new \DateInterval("PT".$target->getWar()->getBzhClan()->getTimer()."H"));
        }
        
        return $d->add(new \DateInterval("PT".$target->getWar()->getBzhClan()->getTimer()."H"));
    }
}
