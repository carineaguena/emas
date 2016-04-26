<?php

class Submissores extends CI_Model
{
    public function getAll()
    {
        return $this->db->order_by('nome')->get('submissores')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('submissores')->row();
    }

    public function getByEmail($email)
    {
        return $this->db->where('email', $email)->get('submissores')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('submissores', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('submissores', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('submissores');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}