<?php

namespace Bzh\WarBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Attack
 *
 * @ORM\Table(name="attack")
 * @ORM\Entity(repositoryClass="Bzh\WarBundle\Repository\AttackRepository")
 * @ORM\HasLifecycleCallbacks
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
    
    /**
     * @var \DateTime
     *
     * @ORM\Column(type="datetime")
     */
    private $timerStart;

    /**
     * @var \DateTime
     *
     * @ORM\Column(type="datetime")
     */
    private $timerEnd;
    
    /**
     * @var \DateTime
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $dateResult;
    
    /**
     * @var bool
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $FirstStarWin;
    
    /**
     * @var bool
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $SecondStarWin;
    
    /**
     * @var bool
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $ThirdStarWin;
    
    /**
     * @var int
     *
     * @ORM\Column(name="hdv", type="integer", nullable=true)
     */
    private $hdv;

    public function __construct()
    {
        $this->dateCreation = new \Datetime();
    }
    
    /*
    * @ORM\PreUpdate()
    */
    public function preUpdate()
    {
        $this->dateMaj = new \DateTime();
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

    /**
     * Set timerStart
     *
     * @param \DateTime $timerStart
     *
     * @return Attack
     */
    public function setTimerStart($timerStart)
    {
        $this->timerStart = $timerStart;

        return $this;
    }

    /**
     * Get timerStart
     *
     * @return \DateTime
     */
    public function getTimerStart()
    {
        return $this->timerStart;
    }

    /**
     * Set timerEnd
     *
     * @param \DateTime $timerEnd
     *
     * @return Attack
     */
    public function setTimerEnd($timerEnd)
    {
        $this->timerEnd = $timerEnd;

        return $this;
    }

    /**
     * Get timerEnd
     *
     * @return \DateTime
     */
    public function getTimerEnd()
    {
        return $this->timerEnd;
    }

    /**
     * Set dateResult
     *
     * @param \DateTime $dateResult
     *
     * @return Attack
     */
    public function setDateResult($dateResult)
    {
        $this->dateResult = $dateResult;

        return $this;
    }

    /**
     * Get dateResult
     *
     * @return \DateTime
     */
    public function getDateResult()
    {
        return $this->dateResult;
    }

    /**
     * Set firstStarWin
     *
     * @param boolean $firstStarWin
     *
     * @return Attack
     */
    public function setFirstStarWin($firstStarWin)
    {
        $this->FirstStarWin = $firstStarWin;

        return $this;
    }

    /**
     * Get firstStarWin
     *
     * @return boolean
     */
    public function getFirstStarWin()
    {
        return $this->FirstStarWin;
    }

    /**
     * Set secondStarWin
     *
     * @param boolean $secondStarWin
     *
     * @return Attack
     */
    public function setSecondStarWin($secondStarWin)
    {
        $this->SecondStarWin = $secondStarWin;

        return $this;
    }

    /**
     * Get secondStarWin
     *
     * @return boolean
     */
    public function getSecondStarWin()
    {
        return $this->SecondStarWin;
    }

    /**
     * Set thirdStarWin
     *
     * @param boolean $thirdStarWin
     *
     * @return Attack
     */
    public function setThirdStarWin($thirdStarWin)
    {
        $this->ThirdStarWin = $thirdStarWin;

        return $this;
    }

    /**
     * Get thirdStarWin
     *
     * @return boolean
     */
    public function getThirdStarWin()
    {
        return $this->ThirdStarWin;
    }
}
