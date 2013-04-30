<?php

namespace Ikdoeict\Provider\Controller;

use Silex\Application;
use Silex\ControllerProviderInterface;
use Silex\ControllerCollection;

class HomeController implements ControllerProviderInterface {

	public function connect(Application $app) {
		$controllers = $app['controllers_factory'];
		$controllers->get('/', array($this, 'home'))->bind('home');
		return $controllers;
	}

	public function home(Application $app) {
                $stages = $app['internships']->findStagesFrontPage();
                $StagesAndSectors = array();
                
                foreach ($stages as $value) {
                    $value['sectors'] = $app['internships']->findSectorsOfTemplate($value['idInternshipTemplate']);
                    array_push($StagesAndSectors, $value);
                }
               
		return $app['twig']->render('home.twig', array('stages' => $StagesAndSectors, 'logininfo' => $app['session']->get('company')));
	}

}