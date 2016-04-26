<?php

class Categorias extends CI_Model
{
    public function getAll($id_evento)
    {
        return $this->db->where('id_evento', $id_evento)->order_by('descricao')->get('categorias')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('categorias')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('categorias', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('categorias', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('categorias');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}