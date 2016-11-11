<?php

namespace Bzh\WarBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Target
 *
 * @ORM\Table(name="target")
 * @ORM\Entity(repositoryClass="Bzh\WarBundle\Repository\TargetRepository")
 * @ORM\HasLifecycleCallbacks
 */
class Target
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
     * @ORM\ManyToOne(targetEntity="Bzh\WarBundle\Entity\War", inversedBy="targets", cascade={"persist"})
     */
    private $war;

    /**
     * @var int
     *
     * @ORM\Column(name="position", type="integer")
     */
    private $position;

    /**
     * @var int
     *
     * @ORM\Column(name="hdv", type="integer", nullable=true)
     */
    private $hdv;

    /**
     * @var string
     *
     * @ORM\Column(name="comment", type="text", nullable=true)
     */
    private $comment;

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
    * @ORM\OneToMany(targetEntity="Bzh\WarBundle\Entity\Attack", mappedBy="target", cascade={"persist", "remove"})
    */
    private $attacks;
    
    /**
    * @ORM\OneToOne(targetEntity="Bzh\WarBundle\Entity\Image", cascade={"persist", "remove"})
    */
    private $image;

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
     * Set position
     *
     * @param integer $position
     *
     * @return Target
     */
    public function setPosition($position)
    {
        $this->position = $position;

        return $this;
    }

    /**
     * Get position
     *
     * @return int
     */
    public function getPosition()
    {
        return $this->position;
    }

    /**
     * Set hdv
     *
     * @param integer $hdv
     *
     * @return Target
     */
    public function setHdv($hdv)
    {
        $this->hdv = $hdv;

        return $this;
    }

    /**
     * Get hdv
     *
     * @return int
     */
    public function getHdv()
    {
        return $this->hdv;
    }

    /**
     * Set comment
     *
     * @param string $comment
     *
     * @return Target
     */
    public function setComment($comment)
    {
        $this->comment = $comment;

        return $this;
    }

    /**
     * Get comment
     *
     * @return string
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set stars
     *
     * @param integer $stars
     *
     * @return Target
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
     * @return Target
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
     * @return Target
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
     * Set war
     *
     * @param \Bzh\WarBundle\Entity\War $war
     *
     * @return Target
     */
    public function setWar(\Bzh\WarBundle\Entity\War $war = null)
    {
        $this->war = $war;

        return $this;
    }

    /**
     * Get war
     *
     * @return \Bzh\WarBundle\Entity\War
     */
    public function getWar()
    {
        return $this->war;
    }

    /**
     * Add attack
     *
     * @param \Bzh\WarBundle\Entity\Target $attack
     *
     * @return Target
     */
    public function addAttack(\Bzh\WarBundle\Entity\Target $attack)
    {
        $this->attacks[] = $attack;

        return $this;
    }

    /**
     * Remove attack
     *
     * @param \Bzh\WarBundle\Entity\Target $attack
     */
    public function removeAttack(\Bzh\WarBundle\Entity\Target $attack)
    {
        $this->attacks->removeElement($attack);
    }

    /**
     * Get attacks
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getAttacks()
    {
        return $this->attacks;
    }

    /**
     * Set image
     *
     * @param \Bzh\WarBundle\Entity\Image $image
     *
     * @return Target
     */
    public function setImage(\Bzh\WarBundle\Entity\Image $image = null)
    {
        $this->image = $image;

        return $this;
    }

    /**
     * Get image
     *
     * @return \Bzh\WarBundle\Entity\Image
     */
    public function getImage()
    {
        return $this->image;
    }
}
