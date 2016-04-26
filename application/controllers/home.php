<?php

class Home extends CI_Controller
{
    public function index()
    {
        $data['event'] = $this->em->getEvent();
        $data['title'] = 'Home';
        $data['content'] = 'home_emas';
        $data['module'] = 'base';

        $this->load->view('simpletemplate', $data);
    }
}