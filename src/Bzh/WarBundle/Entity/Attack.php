<?php

namespace Bzh\WarBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Attack
 *
 * @ORM\Table(name="attack")
 * @ORM\Entity(repositoryClass="Bzh\CoreBundle\Repository\AttackRepository")
 */
class Attack
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Bzh\WarBundle\Entity\Target", inversedBy="attacks", cascade={"persist"})
     */
    private $target;
    
    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;

    /**
     * @var int
     *
     * @ORM\Column(name="stars", type="integer", nullable=true)
     */
    private $stars;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_creation", type="datetime")
     */
    private $dateCreation;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_maj", type="datetime", nullable=true)
     */
    private $dateMaj;

    /**
     * @var float
     *
     * @ORM\Column(name="destruction", type="float", nullable=true)
     */
    private $destruction;

    public function __construct()
    {
        $this->dateCreation = new \Datetime();
    }

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set name
     *
     * @param string $name
     *
     * @return Attack
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set stars
     *
     * @param integer $stars
     *
     * @return Attack
     */
    public function setStars($stars)
    {
        $this->stars = $stars;

        return $this;
    }

    /**
     * Get stars
     *
     * @return int
     */
    public function getStars()
    {
        return $this->stars;
    }

    /**
     * Set dateCreation
     *
     * @param \DateTime $dateCreation
     *
     * @return Attack
     */
    public function setDateCreation($dateCreation)
    {
        $this->dateCreation = $dateCreation;

        return $this;
    }

    /**
     * Get dateCreation
     *
     * @return \DateTime
     */
    public function getDateCreation()
    {
        return $this->dateCreation;
    }

    /**
     * Set dateMaj
     *
     * @param \DateTime $dateMaj
     *
     * @return Attack
     */
    public function setDateMaj($dateMaj)
    {
        $this->dateMaj = $dateMaj;

        return $this;
    }

    /**
     * Get dateMaj
     *
     * @return \DateTime
     */
    public function getDateMaj()
    {
        return $this->dateMaj;
    }

    /**
     * Set destruction
     *
     * @param float $destruction
     *
     * @return Attack
     */
    public function setDestruction($destruction)
    {
        $this->destruction = $destruction;

        return $this;
    }

    /**
     * Get destruction
     *
     * @return float
     */
    public function getDestruction()
    {
        return $this->destruction;
    }

    /**
     * Set target
     *
     * @param \Bzh\WarBundle\Entity\Target $target
     *
     * @return Attack
     */
    public function setTarget(\Bzh\WarBundle\Entity\Target $target = null)
    {
        $this->target = $target;

        return $this;
    }

    /**
     * Get target
     *
     * @return \Bzh\WarBundle\Entity\Target
     */
    public function getTarget()
    {
        return $this->target;
    }
}
