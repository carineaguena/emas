<?php

class Sucesso extends CI_Controller
{
	public function __construct()
    {
        parent::__construct();

        $this->load->model('Areas');
        $this->load->model('Instituicoes');
        $this->load->model('Avaliadores');
        $this->load->model('Municipios');
        
    }

   /* public function index()
    {
        $data['event'] = $this->em->getEvent();
        $data['title'] = 'Avaliador';
        $data['content'] = 'sucesso';
        $data['avaliadores'] = $this->Avaliadores->getAll();

        $this->load->view('template_avaliador', $data);
    }*/

    public function index()
    {
        $erro = $this->session->flashdata('erro');
        if ($erro) {
            $data['erro'] = $erro;
        }
        $msg = $this->session->flashdata('msg');
        if ($msg) {
            $data['msg'] = $msg;
        }
        $data['user'] = $this->auth->get_usuario_logado();
        $data['event'] = $this->em->getEvent();
        $data['title'] = 'Avaliadores';
        $data['content'] = 'sucesso';
        $data['avaliadores'] = $this->Avaliadores->getAll();

        $data['additional_script'] = "
            $('#listagem').dataTable({
                    \"order\": [ 1, 'asc' ],
                    \"paging\": true,
                    \"searching\": false,
                    \"columnDefs\": [
                        { \"orderable\": true, \"targets\": [7] }
                ]
            });
        ";
        $data['scripts'] = array('avaliadores');

        $this->load->view('template_avaliador', $data);
    }
}