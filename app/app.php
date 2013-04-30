<?php

// Bootstrap
require __DIR__ . DIRECTORY_SEPARATOR . 'bootstrap.php';

$app->error(function (\Exception $e, $code) use ($app) {
	if ($code == 404) {
		return $app['twig']->render('errors/404.twig', array('error' => $e->getMessage()));
	} else {
		return 'Shenanigans! Something went horribly wrong // ' . $e->getMessage();
	}
});

// Mount our ControllerProviders
$app->mount('/companies', new Ikdoeict\Provider\Controller\CompanyController());
$app->mount('/internships', new Ikdoeict\Provider\Controller\InternshipController());
$app->mount('/', new Ikdoeict\Provider\Controller\HomeController());

