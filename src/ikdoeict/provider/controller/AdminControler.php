<?php

namespace Ikdoeict\Provider\Controller;

use Silex\Application;
use Silex\ControllerProviderInterface;

class HomeController implements ControllerProviderInterface {

	public function connect(Application $app) {
		$controllers = $app['controllers_factory'];
		$controllers->get('/', array($this, 'home'));
		$controllers->get('/login', array($this, 'login'));

		return $controllers;
	}

	public function home(Application $app) {
		return $app['twig']->render('admin/home.twig');
	}
        
        public function login(Application $app) {
            return $app['twig']->render('admin/login.twig');
        }

}