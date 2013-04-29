<?php

// Bootstrap
require __DIR__ . DIRECTORY_SEPARATOR . 'bootstrap.php';

// Use Request from Symfony Namespace
$app->error(function (\Exception $e, $code) {
	if ($code == 404) {
		//return $app['twig']->render('errors/404.twig', array('error' => $e->getMessage()));
            return '404 - Not Found! // ' . $e->getMessage();
	} else {
		return 'Shenanigans! Something went horribly wrong // ' . $e->getMessage();
	}
});

// Mount our ControllerProviders
$app->mount('/companies', new Ikdoeict\Provider\Controller\BedrijvenController());
$app->mount('/stages', new Ikdoeict\Provider\Controller\StageController());
$app->mount('/', new Ikdoeict\Provider\Controller\HomeController());

