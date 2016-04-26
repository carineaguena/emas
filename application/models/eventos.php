<?php

class Eventos extends CI_Model
{
    public function getAll()
    {
        return $this->db->order_by('nome')->get('eventos')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('eventos')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('eventos', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('eventos', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('eventos');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}