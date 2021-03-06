<?php

namespace Bzh\CoreBundle\Services;

use \Symfony\Component\Intl\Exception\NotImplementedException;

/**
* Nom du service : api.clash
*/
class GetDatasClashOfClans {
    private $token;
    private $url;

    public function __construct($token, $url) {
        $this->token = $token;
        $this->url = $url;
    }
    
    public function SearchClans($name) {
        throw new NotImplementedException();
    }
    
    public function GetClan($tag) {
        $requestUrl = $this->url . 'clans/' . urlencode($tag);
        $json = $this->GetJsonResponse($requestUrl);
        return $json;
    }
    
    public function GetClanMembers($tag) {
        $requestUrl = $this->url . 'clans/' . urlencode($tag) . '/members';
        $json = $this->GetJsonResponse($requestUrl);
        return $json;
    }
    
    public function GetClanWarLog($tag) {
        $requestUrl = $this->url . 'clans/' . urlencode($tag) . '/warlog';
        $json = $this->GetJsonResponse($requestUrl);
        return $json;
    }
    
    public function GetPlayer($tag) {
        $requestUrl = $this->url . 'players/' . urlencode($tag);
        $json = $this->GetJsonResponse($requestUrl);
        return $json;
    }
    
    private function GetJsonResponse($requestUrl) {
        $headers = array(
            'Accept' => 'application/json',
            'authorization' => 'Bearer ' . $this->token
        );
        
        try{
          $response = \Unirest\Request::get($requestUrl, $headers);        
        }
        catch(\Unirest\Exception $e) {
          \Unirest\Request::verifyPeer(false);
          $response = \Unirest\Request::get($requestUrl, $headers);        
        }
        // Retourne le contenu json sous forme de tableau (json decode utilisé dans la méthode)
        return $response->body;
    }
    
}