<?php

class Area extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->auth->verificar_login('submissao');

        $this->load->model('Areas');
    }

    public function getareas()
    {
        $id_categoria = $this->input->post('id_categoria');
        $id_evento = $this->em->getEvent()->id;

        $areas = $this->Areas->getByCategoria($id_evento, $id_categoria);

        $retorno['areas'] = $areas;

        header('content-type: text/json; charset=utf-8');
        echo json_encode($retorno);
    }
}