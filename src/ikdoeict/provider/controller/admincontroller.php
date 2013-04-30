<?php

namespace Ikdoeict\Provider\Controller;

use Silex\Application;
use Silex\ControllerProviderInterface;
use Silex\ControllerCollection;
use Symfony\Component\Validator\Constraints as Assert;

class AdminController implements ControllerProviderInterface {

    public function connect(Application $app) {
        $controllers = $app['controllers_factory'];

        $controllers->get('/', function(Application $app) {
                    return $app->redirect($app['url_generator']->generate('auth.login'));
                });

        $controllers->match('/login', array($this, 'login'))->method('GET|POST')->bind('auth.login');
        $controllers->get('/logout', array($this, 'logout'))->assert('id', '\d+')->bind('auth.logout');

        return $controllers;
    }

    public function login(Application $app) {
        // Already logged in
        if ($app['session']->get('company')) {
            return $app->redirect($app['url_generator']->generate('home'));
        }

        // Create Form
        $loginform = $app['form.factory']->createNamed('loginform')
                ->add('Login', 'text', array('constraints' => array(new Assert\NotBlank())))
                ->add('Password', 'password', array('constraints' => array(new Assert\NotBlank(), new Assert\Length(array('min' => 5)))
        ));

        // Form was submitted: process it
        if ('POST' == $app['request']->getMethod()) {
            $loginform->bind($app['request']);

            if ($loginform->isValid()) {
                $data = $loginform->getData();

                $enterprise = $app['companies']->findLogin($data['Login'], SHA1($data['Password']));

                if ($enterprise) {

                    $app['session']->set('company', array(
                        'id' => $enterprise['idCompany'],
                        'login' => $data['Login']
                    ));

                    return $app->redirect($app['url_generator']->generate('home'));
                } else {
                    $loginform->get('Login');
                    $loginform->get('Password')->addError(new \Symfony\Component\Form\FormError('Invalid password'));
                }
            }
        }

        return $app['twig']->render('Admin/login.twig', array('loginform' => $loginform->createView(), 'logininfo' => $app['session']->get('company')));
    }

    public function logout(Application $app) {
        $app['session']->remove('company');
        return $app->redirect($app['url_generator']->generate('auth.login') . '?loggedout');
    }

}