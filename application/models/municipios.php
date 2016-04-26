<?php

class Municipios extends CI_Model
{
    public function getAll()
    {
        return $this->db->order_by('nome, uf')->get('municipios')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('municipios')->row();
    }

    public function exists($nome, $uf)
    {
        return $this->db->where(array('nome' => $nome, 'uf' => $uf))->get('municipios')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('municipios', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('municipios', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->update('municipios', $dados);
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}