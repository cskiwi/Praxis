<?php

namespace Ikdoeict\Provider\Controller;

use Silex\Application;
use Silex\ControllerProviderInterface;
use Silex\ControllerCollection;

class StageController implements ControllerProviderInterface {

            public function connect(Application $app) {

		//@note $app['controllers_factory'] is a factory that returns a new instance of ControllerCollection when used.
		//@see http://silex.sensiolabs.org/doc/organizing_controllers.html
		$controllers = $app['controllers_factory'];

		// Bind sub-routes
		$controllers->get('/', array($this, 'overview'));
		$controllers->get('/{id}', array($this, 'detail'))->assert('id', '\d+');
                $controllers->get('/{id}/stages/addStage', array($this, 'addStage'))->assert('id', '\d+');

		return $controllers;

	}

	public function overview(Application $app) {
                $stages = $app['stages']->findAll();
		return $app['twig']->render('stages/overview.twig', array('stages' => $stages));
	}


	public function detail(Application $app, $id) {
		$stage = $app['stages']->find($id);
                $companies = $app['companies']->find($stage['idBedrijven']);
		return $app['twig']->render('stages/detail.twig', array('stage' => $stage, 'companies' => $companies));
	}
        
        /*public function addStage(Application $app, $id) {
		$stage = $app['stages']->findAll();
                $companies = $app['companies']->find($stage['idBedrijven']);
		return $app['twig']->render('stages/addStage.twig', array('stage' => $stage, 'companies' => $companies));
	}*/

}