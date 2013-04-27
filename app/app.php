<?php

// Bootstrap
require __DIR__ . DIRECTORY_SEPARATOR . 'bootstrap.php';

$app->error(function (\Exception $e, $code) {
	if ($code == 404) {
		//return $app['twig']->render('errors/404.twig', array('error' => $e->getMessage()));
            return '404 - Not Found! // ' . $e->getMessage();
	} else {
		return 'Shenanigans! Something went horribly wrong // ' . $e->getMessage();
	}
});

$app->get('/', function(Silex\Application $app) {
	return $app->redirect($app['request']->getBaseUrl() . '/companies');
});

// Mount our ControllerProviders
$app->mount('/companies', new Ikdoeict\Provider\Controller\BedrijvenController());
$app->mount('/stages', new Ikdoeict\Provider\Controller\StageController());

