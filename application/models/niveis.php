<?php

class Niveis extends CI_Model
{
    public function getAll($id_evento)
    {
        return $this->db->order_by('descricao')->where('id_evento', $id_evento)->get('niveis')->result();
    }

    public function get($id)
    {
        return $this->db->where('id', $id)->get('niveis')->row();
    }

    public function insert($data)
    {
        return $this->db->insert('niveis', $data);
    }

    public function update($id, $data)
    {
        return $this->db->where('id', $id)->update('niveis', $data);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('niveis');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }
}