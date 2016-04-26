<?php

class Home extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->auth->verificar_login('admin');
    }

    public function index()
    {
        $data['user'] = $this->auth->get_usuario_logado();
        $data['event'] = $this->em->getEvent();
        $data['title'] = 'Home';
        $data['content'] = 'home_admin';
        $data['module'] = 'admin';
        $data['link_nav'] = 'home';

        $this->load->view('template_admin', $data);
    }
}