<?php

class Instituicoes extends CI_Model
{
    public function getAll()
    {
        return $this->db->order_by('nome')->get('instituicoes')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('instituicoes')->row();
    }

    public function getByName($name)
    {
        return $this->db->where('nome', $name)->get('instituicoes')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('instituicoes', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('instituicoes', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('instituicoes');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}