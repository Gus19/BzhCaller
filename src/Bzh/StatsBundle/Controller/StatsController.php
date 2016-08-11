<?php

namespace Bzh\StatsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class StatsController extends Controller
{
    public function indexAction()
    {
        return $this->render('BzhStatsBundle:Stats:index.html.twig', array(
            'test' => 'test'
        ));
    }

}
