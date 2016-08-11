<?php

namespace Bzh\WarBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * War
 *
 * @ORM\Table(name="war")
 * @ORM\Entity(repositoryClass="Bzh\WarBundle\Repository\WarRepository")
 */
class War
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
     * @ORM\Column(name="code", type="string", length=6, unique=true)
     */
    private $code;

    /**
     * @var int
     *
     * @ORM\Column(name="size", type="integer")
     */
    private $size;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_start", type="datetime")
     */
    private $dateStart;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_end", type="datetime")
     */
    private $dateEnd;

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
    private $bzhClan;
    
    /**
     * @ORM\ManyToOne(targetEntity="Bzh\CoreBundle\Entity\Clan", cascade={"persist"})
     */
    private $vsClan;
    
    /**
    * @ORM\OneToMany(targetEntity="Bzh\WarBundle\Entity\Target", mappedBy="war", cascade={"persist", "remove"})
    */
    protected $targets;
    
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
     * Set code
     *
     * @param string $code
     *
     * @return War
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set size
     *
     * @param integer $size
     *
     * @return War
     */
    public function setSize($size)
    {
        $this->size = $size;

        return $this;
    }

    /**
     * Get size
     *
     * @return int
     */
    public function getSize()
    {
        return $this->size;
    }

    /**
     * Set dateStart
     *
     * @param \DateTime $dateStart
     *
     * @return War
     */
    public function setDateStart($dateStart)
    {
        $this->dateStart = $dateStart;

        return $this;
    }

    /**
     * Get dateStart
     *
     * @return \DateTime
     */
    public function getDateStart()
    {
        return $this->dateStart;
    }

    /**
     * Set dateEnd
     *
     * @param \DateTime $dateEnd
     *
     * @return War
     */
    public function setDateEnd($dateEnd)
    {
        $this->dateEnd = $dateEnd;

        return $this;
    }

    /**
     * Get dateEnd
     *
     * @return \DateTime
     */
    public function getDateEnd()
    {
        return $this->dateEnd;
    }

    /**
     * Set dateCreation
     *
     * @param \DateTime $dateCreation
     *
     * @return War
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
     * @return War
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
     * Set bzhClan
     *
     * @param \Bzh\CoreBundle\Entity\Clan $bzhClan
     *
     * @return War
     */
    public function setBzhClan(\Bzh\CoreBundle\Entity\Clan $bzhClan = null)
    {
        $this->bzhClan = $bzhClan;

        return $this;
    }

    /**
     * Get bzhClan
     *
     * @return \Bzh\CoreBundle\Entity\Clan
     */
    public function getBzhClan()
    {
        return $this->bzhClan;
    }

    /**
     * Set vsClan
     *
     * @param \Bzh\CoreBundle\Entity\Clan $vsClan
     *
     * @return War
     */
    public function setVsClan(\Bzh\CoreBundle\Entity\Clan $vsClan = null)
    {
        $this->vsClan = $vsClan;

        return $this;
    }

    /**
     * Get vsClan
     *
     * @return \Bzh\CoreBundle\Entity\Clan
     */
    public function getVsClan()
    {
        return $this->vsClan;
    }
}
