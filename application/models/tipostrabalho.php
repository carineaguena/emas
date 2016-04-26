<?php

class Tipostrabalho extends CI_Model
{
    public function getAll($id_evento)
    {
        return $this->db->where('id_evento', $id_evento)->order_by('descricao')->get('tipos_trabalho')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('tipos_trabalho')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('tipos_trabalho', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('tipos_trabalho', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('tipos_trabalho');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}