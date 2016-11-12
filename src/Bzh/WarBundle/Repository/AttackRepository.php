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
    
    public function setMaxStarsTargetByAttack(Attack $attack) {
        $qb = $this->createQueryBuilder('a');
        $qb->where('a.target = :target');
        $qb->setParameter('target', $attack->getTarget());
        $qb->orderBy('a.stars', 'DESC');
        $qb->setMaxResults(1);
        
        $att = $qb->getQuery()->getOneOrNullResult(); /* @var $att Attack */
        
        if($att != null) {
            $attack->getTarget()->setStars( $att->getStars() );
        }
        else {
            $attack->getTarget()->setStars(0);
        }
    }
    
    public function setMaxStarsTargetByTarget(Target $target) {
        $qb = $this->createQueryBuilder('a');
        $qb->where('a.target = :target');
        $qb->setParameter('target', $target);
        $qb->orderBy('a.stars', 'DESC');
        $qb->setMaxResults(1);
        
        $att = $qb->getQuery()->getOneOrNullResult(); /* @var $att Attack */
        
        if($att != null) {
            $target->setStars( $att->getStars() );
        }
        else {
            $target->setStars(0);
        }
    }
    
    
    public function setStarsWinByAttack(Attack $attack) {
        $qb = $this->createQueryBuilder('a');
        $qb->leftJoin("a.target", "t")->addSelect("t");
        $qb->andWhere('a.target = :target');
        $qb->setParameter('target', $attack->getTarget());
        $qb->andWhere('a.id < :attackid');
        $qb->setParameter('attackid', $attack->getId());
        $qb->orderBy('a.stars', 'DESC');
        $qb->setMaxResults(1);
        
        $attack->setFirstStarWin(false);
        $attack->setSecondStarWin(false);
        $attack->setThirdStarWin(false);
        
        $att = $qb->getQuery()->getOneOrNullResult(); /* @var $att Attack */
        if($att == null) {
            if($attack->getStars() >= 1) {
                $attack->setFirstStarWin(true);
            }
            if($attack->getStars() >= 2) {
                $attack->setSecondStarWin(true);
            }
            if($attack->getStars() >= 3) {
                $attack->setThirdStarWin(true);
            }
        }
        else {
            switch ($att->getStars()) {
                case 0:
                    if($attack->getStars() >= 1) {
                        $attack->setFirstStarWin(true);
                    }
                    if($attack->getStars() >= 2) {
                        $attack->setSecondStarWin(true);
                    }
                    if($attack->getStars() >= 3) {
                        $attack->setThirdStarWin(true);
                    }
                case 1:
                    if($attack->getStars() >= 2) {
                        $attack->setSecondStarWin(true);
                    }
                    if($attack->getStars() >= 3) {
                        $attack->setThirdStarWin(true);
                    }
                    break;
                case 2:
                    if($attack->getStars() >= 3) {
                        $attack->setThirdStarWin(true);
                    }
                    break;
            }
        }
        
    }
    
}
