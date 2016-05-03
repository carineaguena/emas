<?php

class Home extends CI_Controller
{
    public function index()
    {
        $data['event'] = $this->em->getEvent();
        $data['title'] = 'Home';
        $data['content'] = 'home_avaliador';

        $this->load->view('simpletemplate', $data);
    }
}