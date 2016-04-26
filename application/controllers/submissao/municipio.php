<?php

class Municipio extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        //$this->auth->verificar_login('submissao');

        $this->load->model('Municipios');
    }

    public function adicionar()
    {
        $nome_municipio = $this->input->post('nome_municipio');
        $uf_municipio = mb_strtoupper($this->input->post('uf_municipio'));

        $data['nome'] = $nome_municipio;
        $data['uf'] = $uf_municipio;

        $municipio = $this->Municipios->exists($nome_municipio, $uf_municipio);

        if ($municipio) {
            $retorno['inserido'] = 'N';
        }
        else {
            $this->Municipios->insert($data);

            $id = $this->Municipios->getInsertId();

            $municipios = $this->Municipios->getAll();

            $options = '<option value="">-- Selecione o município --</option>';

            foreach($municipios as $municipio) {
                $options .= '<option value="' . $municipio->id . '">' . $municipio->nome . ' (' . $municipio->uf . ')</option>';
            }

            $retorno['inserido'] = 'S';
            $retorno['id_novo'] = $id;
            $retorno['options'] = $options;
        }

        header('content-type: text/json; charset=utf-8');
        echo json_encode($retorno);
    }
}