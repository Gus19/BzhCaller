<?php
namespace Bzh\WarBundle\Repository;

use Bzh\WarBundle\Entity\War;

class TargetRepository extends \Doctrine\ORM\EntityRepository
{
    public function deleteByWar(War $war) {
        $qb = $this->createQueryBuilder('t');
        $qb->delete();
        $qb->where('t.war = :war');
        $qb->setParameter('war', $war);
        $qb->getQuery()->execute();
    }
}
