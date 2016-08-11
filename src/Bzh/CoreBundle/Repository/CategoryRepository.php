<?php

namespace Bzh\CoreBundle\Repository;

use Gedmo\Tree\Traits\Repository\ORM\NestedTreeRepositoryTrait;

class CategoryRepository extends \Gedmo\Tree\Entity\Repository\NestedTreeRepository
{
    //use NestedTreeRepositoryTrait; // or MaterializedPathRepositoryTrait or ClosureTreeRepositoryTrait.

    public function __construct(EntityManager $em, ClassMetadata $class)
    {
        parent::__construct($em, $class);

        $this->initializeTreeRepository($em, $class);
    }
    
    public function findOneByParentAndChild($parent, $title) {
        $qb = $this->createQueryBuilder('c');
        $qb
            ->andWhere('c.title = :title')->setParameter('title', $title)
            ->innerJoin("c.parent", "p")
            ->andWhere('p.title = :parent')->setParameter('parent', $parent)
            ;
        
        return $qb->getQuery()->getResult();  
    }
}