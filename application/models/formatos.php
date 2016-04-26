<?php

class Formatos extends CI_Model
{
    public function getAll($id_evento)
    {
        return $this->db->where('id_evento', $id_evento)->order_by('descricao')->get('formatos')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('formatos')->row();
    }

    public function getByNivelTipo($id_nivel, $id_tipo)
    {
        return $this->db->where(array('id_nivel' => $id_nivel, 'id_tipo' => $id_tipo))->order_by('descricao')->get('formatos')->row();
    }

    public function insert($dados)
    {
        return $this->db->insert('formatos', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('formatos', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('formatos');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}
