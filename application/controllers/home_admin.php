<?php

class Home_admin extends CI_Controller
{
    public function index()
    {
        $data['event'] = $this->em->getEvent();
        $data['title'] = 'Home';
        $data['content'] = 'home_emas';
        //$data['content'] = 'home';
        $data['module'] = 'base';

        $this->load->view('simpletemplate', $data);
    }
}