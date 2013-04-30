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
                    return $app->redirect($app['url_generator']->generate('admin.login'));
                });

        $controllers->match('/login', array($this, 'login'))->method('GET|POST')->bind('admin.login');
        $controllers->get('/logout', array($this, 'logout'))->assert('id', '\d+')->bind('admin.logout');

        $controllers->match('/addstage', array($this, 'addStage'))->method('GET|POST')->bind('admin.addStage');
        $controllers->match('/addFacility', array($this, 'addFacility'))->method('GET|POST')->bind('admin.addFacility');


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
        return $app->redirect($app['url_generator']->generate('admin.login') . '?loggedout');
    }

    public function addStage(Application $app) {
// Create Form
        $addStage = $app['form.factory']->createNamed('addStage')
                ->add('Title', 'text', array('constraints' => array(new Assert\NotBlank())))
                ->add('Location', 'text', array('constraints' => array(new Assert\NotBlank())))
                ->add('StartDate', 'date', array('constraints' => array(new Assert\NotBlank())))
                ->add('EndDate', 'date', array('constraints' => array(new Assert\NotBlank())))
                ->add('RequiredKnowledge', 'textarea', array('constraints' => array(new Assert\NotBlank())))
                ->add('Description', 'textarea', array('constraints' => array(new Assert\NotBlank())))
                ->add('Sector', 'text', array('constraints' => array(new Assert\NotBlank())
        ));

        if ('POST' == $app['request']->getMethod()) {
            $addStage->bind($app['request']);

            if ($addStage->isValid()) {
                $data = $addStage->getData();

                if ($data['CompanyLogin'] != $app['session']->get('company')['login']) {
                    
                }
            }
        }

        return $app['twig']->render('Admin/addStage.twig', array('addStage' => $addStage->createView(), 'logininfo' => $app['session']->get('company')));
    }

    public function addFacility(Application $app) {
// Create Form
        $addStage = $app['form.factory']->createNamed('addStage')
                ->add('Name', 'text', array('constraints' => array(new Assert\NotBlank())))
                ->add('Street', 'text', array('constraints' => array(new Assert\NotBlank())))
                ->add('City', 'text', array('constraints' => array(new Assert\NotBlank())))
                ->add('HouseNr', 'text', array('constraints' => array(new Assert\NotBlank())))
                ->add('Country', 'text', array('constraints' => array(new Assert\NotBlank())))
                ->add('Phone', 'text', array('constraints' => array(new Assert\NotBlank())))
                ->add('Fax', 'text', array('constraints' => array(new Assert\NotBlank())
        ));

        if ('POST' == $app['request']->getMethod()) {
            $addStage->bind($app['request']);

            if ($addStage->isValid()) {
                $data = $addStage->getData();
                array_push($data, $app['session']->get('company')['login']);
                $app['companies']->addFacility($data);
            }
        }
        return $app['twig']->render('Admin/addFacility.twig', array('addFacility' => $addStage->createView(), 'logininfo' => $app['session']->get('company')));

    }

}