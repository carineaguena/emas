<?php

class Formato extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->auth->verificar_login('submissao');

        $this->load->model('Formatos');
        $this->load->model('Modalidades');
    }

    public function getformatos()
    {
        $id_nivel = $this->input->post('id_nivel');
        $id_tipo = $this->input->post('id_tipo');

        $id_evento = $this->em->getEvent()->id;

        $modalidade = $this->Modalidades->getByNivel($id_nivel);

        $formato = $this->Formatos->getByNivelTipo($id_nivel, $id_tipo);

        $retorno['temFormatos'] = !empty($formato) ? 'S' : 'N';
        $retorno['formato'] = $formato ? $formato->descricao : '';
        $retorno['id_formato'] = $formato ? $formato->id : '';
        $retorno['modalidade'] = $modalidade;
        $retorno['id_nivel'] = $id_nivel;

        header('content-type: text/json; charset=utf-8');
        echo json_encode($retorno);
    }
}
