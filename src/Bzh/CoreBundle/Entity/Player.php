<?php

namespace Bzh\CoreBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Player
 *
 * @ORM\Table(name="player")
 * @ORM\Entity(repositoryClass="Bzh\CoreBundle\Repository\PlayerRepository")
 * @ORM\HasLifecycleCallbacks
 */
class Player
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
     * @var string
     *
     * @ORM\Column(name="tag", type="string", length=255, unique=true)
     */
    private $tag;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     */
    private $name;
    
    /**
     * @var int
     *
     * @ORM\Column(name="hdv", type="integer", nullable=false)
     */
    private $hdv;

    /**
     * @var string
     *
     * @ORM\Column(name="role", type="string", length=255)
     */
    private $role;
    
    /**
     * @var int
     *
     * @ORM\Column(name="exp_level", type="integer", nullable=false)
     */
    private $expLevel;
    
    /**
     * @var int
     *
     * @ORM\Column(name="war_stars", type="integer", nullable=false)
     */
    private $warStars;
    
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
     * @ORM\ManyToOne(targetEntity="Bzh\CoreBundle\Entity\Clan", cascade={"persist"})
     */
    private $clan;
    
    /**
     * @var bool
     * @ORM\Column(type="boolean", nullable=false)
     */
    private $old;
    
    /**
     * @var int
     *
     * @ORM\Column(type="integer", nullable=true)
     */
    private $trophies;
    
    /**
     * @var int
     *
     * @ORM\Column(type="integer", nullable=true)
     */
    private $bestTrophies;
    
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
     * Set tag
     *
     * @param string $tag
     *
     * @return Player
     */
    public function setTag($tag)
    {
        $this->tag = $tag;

        return $this;
    }

    /**
     * Get tag
     *
     * @return string
     */
    public function getTag()
    {
        return $this->tag;
    }

    /**
     * Set name
     *
     * @param string $name
     *
     * @return Player
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
     * Set dateCreation
     *
     * @param \DateTime $dateCreation
     *
     * @return Player
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
     * @return Player
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
     * Set old
     *
     * @param boolean $old
     *
     * @return Player
     */
    public function setOld($old)
    {
        $this->old = $old;

        return $this;
    }

    /**
     * Get old
     *
     * @return boolean
     */
    public function getOld()
    {
        return $this->old;
    }

    /**
     * Set clan
     *
     * @param \Bzh\CoreBundle\Entity\Clan $clan
     *
     * @return Player
     */
    public function setClan(\Bzh\CoreBundle\Entity\Clan $clan = null)
    {
        $this->clan = $clan;

        return $this;
    }

    /**
     * Get clan
     *
     * @return \Bzh\CoreBundle\Entity\Clan
     */
    public function getClan()
    {
        return $this->clan;
    }

    /**
     * Set hdv
     *
     * @param integer $hdv
     *
     * @return Player
     */
    public function setHdv($hdv)
    {
        $this->hdv = $hdv;

        return $this;
    }

    /**
     * Get hdv
     *
     * @return integer
     */
    public function getHdv()
    {
        return $this->hdv;
    }

    /**
     * Set role
     *
     * @param string $role
     *
     * @return Player
     */
    public function setRole($role)
    {
        $this->role = $role;

        return $this;
    }

    /**
     * Get role
     *
     * @return string
     */
    public function getRole()
    {
        return $this->role;
    }

    /**
     * Set expLevel
     *
     * @param integer $expLevel
     *
     * @return Player
     */
    public function setExpLevel($expLevel)
    {
        $this->expLevel = $expLevel;

        return $this;
    }

    /**
     * Get expLevel
     *
     * @return integer
     */
    public function getExpLevel()
    {
        return $this->expLevel;
    }

    /**
     * Set warStars
     *
     * @param integer $warStars
     *
     * @return Player
     */
    public function setWarStars($warStars)
    {
        $this->warStars = $warStars;

        return $this;
    }

    /**
     * Get warStars
     *
     * @return integer
     */
    public function getWarStars()
    {
        return $this->warStars;
    }

    /**
     * Set trophies
     *
     * @param integer $trophies
     *
     * @return Player
     */
    public function setTrophies($trophies)
    {
        $this->trophies = $trophies;

        return $this;
    }

    /**
     * Get trophies
     *
     * @return integer
     */
    public function getTrophies()
    {
        return $this->trophies;
    }

    /**
     * Set bestTrophies
     *
     * @param integer $bestTrophies
     *
     * @return Player
     */
    public function setBestTrophies($bestTrophies)
    {
        $this->bestTrophies = $bestTrophies;

        return $this;
    }

    /**
     * Get bestTrophies
     *
     * @return integer
     */
    public function getBestTrophies()
    {
        return $this->bestTrophies;
    }
}
