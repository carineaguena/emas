<?php

class Instituicao extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        //$this->auth->verificar_login('submissao');

        $this->load->model('Instituicoes');
    }

    public function adicionar()
    {
        $nome_instituicao = $this->input->post('nome_instituicao');

        $data['nome'] = $nome_instituicao;

        $instituicao = $this->Instituicoes->getByName($nome_instituicao);

        if ($instituicao) {
            $retorno['inserido'] = 'N';
        }
        else {
            $this->Instituicoes->insert($data);

            $id = $this->Instituicoes->getInsertId();

            $instituicoes = $this->Instituicoes->getAll();

            $options = '<option value="">-- Selecione a instituição --</option>';

            foreach($instituicoes as $instituicao) {
                $options .= '<option value="' . $instituicao->id . '">' . $instituicao->nome . '</option>';
            }

            $retorno['inserido'] = 'S';
            $retorno['id_novo'] = $id;
            $retorno['options'] = $options;
        }

        header('content-type: text/json; charset=utf-8');
        echo json_encode($retorno);
    }
}