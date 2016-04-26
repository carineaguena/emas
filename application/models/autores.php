<?php

class Autores extends CI_Model
{
    public function getByTrabalho($id_trabalho)
    {
        return $this->db->where('id_trabalho', $id_trabalho)->get('autores')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('autores')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('autores', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('autores', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('autores');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}