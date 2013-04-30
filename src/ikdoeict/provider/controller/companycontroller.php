<?php

namespace Ikdoeict\Provider\Controller;

use Silex\Application;
use Silex\ControllerProviderInterface;

class CompanyController implements ControllerProviderInterface {

	public function connect(Application $app) {

		//@note $app['controllers_factory'] is a factory that returns a new instance of ControllerCollection when used.
		//@see http://silex.sensiolabs.org/doc/organizing_controllers.html
		$controllers = $app['controllers_factory'];

		// Bind sub-routes
		$controllers->get('/', array($this, 'overview'));
                $controllers->get('/{companyID}', array($this, 'detail'))->assert('$companyID', '\d+');
                $controllers->get('/{companyID}/internships', array($this, 'listStages'))->assert('$companyID', '\d+');
		return $controllers;

	}

	public function overview(Application $app) {
		$companies = $app['companies']->findAll();
		return $app['twig']->render('companies/overview.twig', array('companies' => $companies));
	}
        
        public function detail(Application $app, $companyID) {
		$companie = $app['companies']->find($companyID);
                $facilities = $app['companies']->findCompanyFacileties($companyID);
                $StagesMetFacility = array();
                
                foreach ($facilities as $value) {
                    $value['stages'] = $app['internships']->findStages($value['idFacility']);
                    array_push($StagesMetFacility, $value);
                }
                
		if (!$companie) {
			$app->abort(404, 'Author $id does not exist');
		}
                if (!$facilities) {
			$app->abort(404, 'Bedrijf $id does not exist');
		}
		return $app['twig']->render('companies/detail.twig', array('companie' => $companie, 'facilities' => $StagesMetFacility));
	}
        public function listStages(Application $app, $companyID) {
		$companies = $app['companies']->find($companyID);
                $stages = $app['internships']->findStages($companyID);
                
		if (!$companies) {
			$app->abort(404, 'Author $id does not exist');
		}
                if (!$stages) {
			$app->abort(404, 'Bedrijf $id does not exist');
		}
                
                
                if (!$stages) {
			$app->abort(404, 'Bedrijf $id does not exist');
		}
		return $app['twig']->render('stages/stagesCompany.twig', array( 'stages' => $stages, 'companies' => $companies));
	}
}