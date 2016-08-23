<?php
namespace Bzh\WarBundle\Services;

class CreateWarCode {
    
    private $len;

    public function __construct($len)
    {
        $this->len = $len;
    }
    
    public function setLen($len) {
        $this->len = $len;
    }
    
    public function generate() {
        return substr(md5(uniqid(rand(), true)),0, $this->len);
    }
}