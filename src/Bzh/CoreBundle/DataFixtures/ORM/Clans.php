<?php
// src/OC/ReaderBundle/DataFixtures/ORM/TokyoGhoulRe.php

namespace Bzh\CoreBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

use Bzh\CoreBundle\Repository\CategoryRepository;
use Bzh\CoreBundle\Entity\Clan;
use Bzh\WarBundle\Entity\War;

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

<p style="text-align:center"><span style="font-size:16px">1&egrave;re attaque en respectant le &quot;timer&quot; de 3h autant que possible, et en tout &eacute;tat de cause AVANT MIDI (sinon votre cible devient dispo pour un autre joueur).</span></p>

<p style="text-align:center"><span style="font-size:16px">R&eacute;servez votre 2&egrave;me attaque avec le bouton + (choisissez une cible o&ugrave; vous &ecirc;tes en mesure de faire 3 &eacute;toiles, on ne pense pas butin !!!)</span></p>

<p style="text-align:center"><span style="font-size:16px">Plus on est bas, plus on fait ses attaques rapidement (&agrave; l&#39;inverse le haut garde une attaque pour la fin si possible)</span></p>

<p style="text-align:center"><span style="font-size:16px">Bon clash et soyez rigoureux, si vous faites n&#39;importe quoi c&#39;est tout le clan qui perd...</span></p>';
        
        $bhz = new Clan();
        $bhz->setName("clash bzh");
        $bhz->setLevel(9);
        $bhz->setTimer(3);
        $bhz->setType(1);
        $bhz->setDescription($description);
        $bhz->setTag("#2GL2GPC9");
        $em->persist($bhz);
        
        $skol = new Clan();
        $skol->setName("Skol Clash Bzh");
        $skol->setLevel(6);
        $skol->setTimer(3);
        $skol->setType(1);
        $skol->setDescription($description);
        $skol->setTag("#9QPYC90P");
        $em->persist($skol);
        
        /*$vsclan = new Clan();
        $vsclan->setName("Dell Mazoo");
        $vsclan->setLevel(10);
        $vsclan->setType(2);
        $vsclan->setTag("#P22L88V9");
        $em->persist($vsclan);
        
        $dateStart = new \DateTime();
        $dateStart->setDate(2016, 8, 18);
        $dateStart->setTime(21, 30, 00);
        
        $dateEnd = new \DateTime();
        $dateEnd->setDate(2016, 8, 19);
        $dateEnd->setTime(21, 30, 00);
        
        $war = new War();
        $war->setBzhClan($skol);
        $war->setCode( $this->container->get('war.code.new')->generate() );
        $war->setDateEnd($dateStart);
        $war->setDateStart($dateEnd);
        $war->setDestructionBzh(90.65);
        $war->setDestructionVs(89.75);
        $war->setResult('V');
        $war->setSize(20);
        $war->setStarsBzh(53);
        $war->setStarsVs(50);
        $war->setVsClan($vsclan);
        $this->container->get('war.targets.create')->generate($war, 20);
        $em->persist($war);
        
        $dateStart2 = new \DateTime();
        $dateStart2->setDate(2016, 8, 20);
        $dateStart2->setTime(23, 30, 00);
        
        $dateEnd2 = new \DateTime();
        $dateEnd2->setDate(2016, 8, 21);
        $dateEnd2->setTime(23, 30, 00);
        
        $war2 = new War();
        $war2->setBzhClan($skol);
        $war2->setCode( $this->container->get('war.code.new')->generate() );
        $war2->setDateEnd($dateEnd2);
        $war2->setDateStart($dateStart2);
        $war2->setSize(10);
        $war2->setVsClan($vsclan);
        $this->container->get('war.targets.create')->generate($war2, 10);
        $em->persist($war2);*/
        
        $em->flush();
    }
  
    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }

}