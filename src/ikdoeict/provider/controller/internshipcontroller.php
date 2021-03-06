<?php

namespace Ikdoeict\Provider\Controller;

use Silex\Application;
use Silex\ControllerProviderInterface;
use Silex\ControllerCollection;

class InternshipController implements ControllerProviderInterface {

            public function connect(Application $app) {

		//@note $app['controllers_factory'] is a factory that returns a new instance of ControllerCollection when used.
		//@see http://silex.sensiolabs.org/doc/organizing_controllers.html
		$controllers = $app['controllers_factory'];

		// Bind sub-routes
		$controllers->get('/', array($this, 'overview'))->bind('Internship');
		$controllers->get('/{id}', array($this, 'detail'))->assert('id', '\d+');
                $controllers->get('/{id}/internships/addStage', array($this, 'addStage'))->assert('id', '\d+');

		return $controllers;

	}

	public function overview(Application $app) {
                $internships = $app['internships']->findAll();
		return $app['twig']->render('stages/overview.twig', array('internships' => $internships, 'logininfo' => $app['session']->get('company')));
	}


	public function detail(Application $app, $id) {
		$internship = $app['internships']->find($id);
    		return $app['twig']->render('stages/detail.twig', array('internship' => $internship, 'logininfo' => $app['session']->get('company')));
	}
}