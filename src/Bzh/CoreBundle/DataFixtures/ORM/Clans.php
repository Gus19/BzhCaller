<?php
// src/OC/ReaderBundle/DataFixtures/ORM/TokyoGhoulRe.php

namespace Bzh\CoreBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

use Bzh\CoreBundle\Repository\CategoryRepository;
use Bzh\CoreBundle\Entity\Category;
use Bzh\CoreBundle\Entity\Clan;

class Clans extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface
{
    private $container;
  
    public function setContainer(ContainerInterface $container = null)
    {
        $this->container = $container;
    }
  
    public function load(ObjectManager $em)
    {
        /* @var $repoCat CategoryRepository */
        //$repoCat = $em->getRepository("CoreBundle:Category");
        //$typeClan = $repoCat->findOneByParentAndChild("Type de clan", "Clan BZH");
        //$typeClan = $repoCat->findOneByTitle("Clan BZH");
        
        $description = '<p style="text-align:center"><span style="font-size:16px">Votre cible pour votre 1&egrave;re attaque vous est attribu&eacute;e.</span></p>

<p style="text-align:center"><span style="font-size:16px">Apr&eacute;s votre attaque notez votre score avec le bouton sous votre pseudo.</span></p>

<p style="text-align:center"><span style="font-size:16px">1&egrave;re attaque en respectant le &quot;timer&quot; de 6h00 autant que possible, et en tout &eacute;tat de cause AVANT MIDI (sinon votre cible devient dispo pour un autre joueur).</span></p>

<p style="text-align:center"><span style="font-size:16px">R&eacute;servez votre 2&egrave;me attaque avec le bouton + (choisissez une cible o&ugrave; vous &ecirc;tes en mesure de faire 3 &eacute;toiles, on ne pense pas butin !!!)</span></p>

<p style="text-align:center"><span style="font-size:16px">Plus on est bas, plus on fait ses attaques rapidement (&agrave; l&#39;inverse le haut garde une attaque pour la fin si possible)</span></p>

<p style="text-align:center"><span style="font-size:16px">Bon clash et soyez rigoureux, si vous faites n&#39;importe quoi c&#39;est tout le clan qui perd...</span></p>';
        
        $bhz = new Clan();
        $bhz->setName("clash bhz");
        $bhz->setLevel(9);
        $bhz->setTimer(6);
        $bhz->setType(1);
        $bhz->setDescription($description);
        $em->persist($bhz);
        
        $skol = new Clan();
        $skol->setName("Skol Clash Bhz");
        $skol->setLevel(6);
        $skol->setTimer(6);
        $skol->setType(1);
        $skol->setDescription($description);
        $em->persist($skol);
        
        /*$kwroyal = new Clan();
        $kwroyal->setName("Kw royal");
        $kwroyal->setLevel(10);
        $kwroyal->setType(2);
        $em->persist($kwroyal);*/
        
        $em->flush();
    }
  
    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }

}