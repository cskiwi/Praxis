<?php

// Require Composer Autoloader
require_once __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php';

// Create new Silex App
$app = new Silex\Application();

// App Configuration
$app['debug'] = true;

// Use Twig — @note: Be sure to install Twig via Composer first!
$app->register(new Silex\Provider\TwigServiceProvider(), array(
	'twig.path' => __DIR__ .  DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . 'views'
));

$app->register(new Silex\Provider\DoctrineServiceProvider(), array(
    'db.options' => array(
        'driver' => 'pdo_mysql',
        'host' => 'localhost:3307',
        'dbname' => 'praxis',
        'user' => 'root',
        'password' => 'Azerty123'
    )
));

$app->register(new Knp\Provider\RepositoryServiceProvider(), array(
	'repository.repositories' => array(
		'companies' => 'Ikdoeict\\Repository\\BedrijvenRepository',
		'stages' => 'Ikdoeict\\Repository\\StageRepository'
	)
));