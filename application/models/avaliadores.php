<?php

class Avaliadores extends CI_Model
{
    public function getAll()
    {
        return $this->db->order_by('nome')->get('avaliadores')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('avaliadores')->row();
    }

    public function getByEmail($email)
    {
        return $this->db->where('email', $email)->get('avaliadores')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('avaliadores', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('avaliadores', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('avaliadores');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}