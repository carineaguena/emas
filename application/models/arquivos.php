<?php

class Arquivos extends CI_Model
{
    public function getAll()
    {
        return $this->db->get('arquivos_trabalho')->result();
    }

    public function getByTrabalho($id_trabalho)
    {
        return $this->db->where('id_trabalho', $id_trabalho)->order_by('data_submissao desc')->get('arquivos_trabalho')->result();
    }

    public function getLastByTrabalhoTipo($id_trabalho, $tipo)
    {
        return $this->db->where(array('id_trabalho' => $id_trabalho, 'tipo_arquivo' => $tipo))->order_by('data_submissao desc, hora_submissao desc')->limit(1)->get('arquivos_trabalho')->row();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('arquivos_trabalho')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('arquivos_trabalho', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('arquivos_trabalho', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('arquivos_trabalho');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}