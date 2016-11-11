<?php

namespace Bzh\CoreBundle\Repository;

/**
 * PlayerRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class PlayerRepository extends \Doctrine\ORM\EntityRepository
{
    public function setOldAllPlayers(\Bzh\CoreBundle\Entity\Clan $clan, $value) {
        return $this->createQueryBuilder('u')
            ->update()
            ->where('u.clan = :clan')
                ->setParameter(":clan", $clan)
            ->set('u.old', ':old')
                ->setParameter(":old", $value)
            ->getQuery()->getSingleScalarResult();
        
    }
}
