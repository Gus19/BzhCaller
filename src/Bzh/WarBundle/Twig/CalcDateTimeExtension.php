<?php

namespace Bzh\WarBundle\Twig;

use Bzh\WarBundle\Services\CalcDateTime;

class CalcDateTimeExtension extends \Twig_Extension
{
    /**
    * @var CalcDateTime
    */
    private $calc;
    public function __construct(CalcDateTime $calc)
    {
        $this->calc = $calc;
    }

    public function textDiff($diff)
    {
        return $this->calc->textDiff($diff);
    }
    
    public function getName() {
        return 'CalcDateTime';
    }
    
    public function getFunctions()
    {
        return array(
            new \Twig_SimpleFunction('textDiff', array($this, 'textDiff')),
        );
    }
}