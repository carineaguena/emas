<?php

class Areas extends CI_Model
{
    public function getAll($id_evento)
    {
        return $this->db->where('id_evento', $id_evento)->order_by('nome')->get('areas')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('areas')->row();
    }

    public function getByCategoria($id_evento, $id_categoria) {
        return $this->db->where(array('id_evento' => $id_evento, 'id_categoria' => $id_categoria))->order_by('nome')->get('areas')->result();
    }

    public function insert($dados)
    {
        return $this->db->insert('areas', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('areas', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('areas');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}