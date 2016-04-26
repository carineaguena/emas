<?php

class Modalidades extends CI_model
{
    public function getAll($id_evento)
    {
        return $this->db->where('id_evento', $id_evento)->order_by('descricao')->get('modalidades')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('modalidades')->row();
    }

    public function getByNivel($id_nivel)
    {
        return $this->db->where('id_nivel',$id_nivel)->get('modalidades')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('modalidades', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('modalidades', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('modalidades');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}