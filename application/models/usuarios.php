<?php

class Usuarios extends CI_Model
{
    public function getAll()
    {
        return $this->db->order_by('nome')->get('usuarios')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('usuarios')->row();
    }

    public function getByLogin($login)
    {
        return $this->db->where('login', $login)->get('usuarios')->row();
    }

    public function getByEmail($email)
    {
        return $this->db->where('email', $email)->get('usuarios')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('usuarios', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('usuarios', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('usuarios');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}