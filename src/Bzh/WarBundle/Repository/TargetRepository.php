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
    
    public function findTargetsAndAttacksByWar(War $war) {
        $qb = $this->createQueryBuilder('t');
        $qb->leftJoin("t.attacks", "a")->addSelect("a");
        $qb->where('t.war = :war');
        $qb->setParameter('war', $war);
        $qb->addOrderBy('t.position');
        $qb->addOrderBy('a.dateResult');
        $qb->addOrderBy('a.dateCreation');
        return $qb->getQuery()->getResult();
    }
    
    public function findCommentById($id) {
        $qb = $this->createQueryBuilder('t');
        $qb->leftJoin("t.image", "i")->addSelect("i");
        $qb->leftJoin("t.war", "w")->addSelect("w");
        $qb->where('t.id = :id')->setParameter('id', $id);
        return $qb->getQuery()->getOneOrNullResult();
    }
    
    
    public function findTotalStars(War $war) {
        return $this->createQueryBuilder('t')
            ->andWhere('t.war = :war')
            ->setParameter('war', $war)
            ->select('SUM(t.stars)')
            ->getQuery()
            ->getSingleScalarResult();
    }
}
