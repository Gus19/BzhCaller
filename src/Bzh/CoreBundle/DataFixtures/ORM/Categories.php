<?php
// src/OC/ReaderBundle/DataFixtures/ORM/TokyoGhoulRe.php

namespace OC\PlatformBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Bzh\CoreBundle\Entity\Category;

class Categories extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface
{
    private $container;
  
    public function setContainer(ContainerInterface $container = null)
    {
        $this->container = $container;
    }
  
    public function load(ObjectManager $em)
    {
        /*$racine = new Category();
        $racine->setTitle("Racine");

        // Les types de clans
        $typeClan = new Category();
        $typeClan->setTitle("Type de clan");
        
        $clanbzh = new Category();
        $clanbzh->setTitle("Clan BZH");
        $typeClan->addChildren($clanbzh);
        
        $clanennemi = new Category();
        $clanennemi->setTitle("Clan ennemi");
        $typeClan->addChildren($clanennemi);
    
        $racine->addChildren($typeClan);
        
        // Les grades
        $grade = new Category();
        $grade->setTitle("Grade");
        
        $chef = new Category();
        $chef->setTitle("Chef");
        $grade->addChildren($chef);
        
        $adjoint = new Category();
        $adjoint->setTitle("Chef adjoint");
        $grade->addChildren($adjoint);
        
        $aine = new Category();
        $aine->setTitle("Ainé");
        $grade->addChildren($aine);
        
        $membre = new Category();
        $membre->setTitle("Membre");
        $grade->addChildren($membre);
        
        $racine->addChildren($grade);
        
        $em->persist($racine);
        
        $em->flush();*/
    }
  
    public function getOrder()
    {
        return null; // the order in which fixtures will be loaded
    }

}