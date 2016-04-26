<?php

class Trabalhos extends CI_Model
{
    public function getAll($id_evento, $ordem = 'titulo')
    {
        return $this->getBaseQuery()->where('t.id_evento', $id_evento)->order_by($ordem)->get()->result();
    }

    public function get($id)
    {
        return $this->getBaseQuery()->where('t.id', $id)->get()->row();
    }

    public function getByArea($id_evento, $id_area)
    {
        return $this->getBaseQuery()->where(array('t.id_evento' => $id_evento, 't.id_area' => $id_area))->order_by('t.titulo')->get()->result();
    }

    public function getByModalidade($id_evento, $id_modalidade)
    {
        return $this->getBaseQuery()->where(array('t.id_evento' => $id_evento, 't.id_modalidade' => $id_modalidade))->order_by('t.titulo')->get()->result();
    }

    public function getByCategoria($id_evento, $id_categoria)
    {
        return $this->getBaseQuery()->where(array('t.id_evento' => $id_evento, 't.id_categoria' => $id_categoria))->order_by('t.titulo')->get()->result();
    }

    public function getByTipo($id_evento, $id_tipo)
    {
        return $this->getBaseQuery()->where(array('t.id_evento' => $id_evento, 't.id_tipo_trabalho' => $id_tipo))->order_by('t.titulo')->get()->result();
    }

    public function getBySubmissor($id_evento, $id_submissor)
    {
        return $this->getBaseQuery()->where(array('t.id_evento' => $id_evento, 't.id_submissor' => $id_submissor))->order_by('t.titulo')->get()->result();
    }

    public function insert($dados)
    {
        return $this->db->insert('trabalhos', $dados);
    }

    public function update($id, $dados)
    {
        return $this->db->where('id', $id)->update('trabalhos', $dados);
    }

    public function delete($id)
    {
        return $this->db->where('id', $id)->delete('trabalhos');
    }

    public function getInsertId()
    {
        return $this->db->insert_id();
    }

    private function getBaseQuery()
    {
        return $this->db->select('t.id, t.titulo, t.resumo, t.nome_orientador, t.email_orientador, t.nome_coorientador1, t.email_coorientador1, t.nome_coorientador2, t.email_coorientador2, t.selecionado, a.nome as area, c.descricao as categoria, m.descricao as modalidade, n.descricao as nivel, tt.descricao as tipo, f.descricao as formato, s.nome as submissor, s.email as email_submissor, t.id_area, t.id_modalidade, t.id_formato, t.id_categoria, t.id_tipo, t.id_nivel')->from('trabalhos AS t')->join('areas a', 'a.id = t.id_area')->join('categorias c', 'c.id = t.id_categoria')->join('modalidades m', 'm.id = t.id_modalidade')->join('tipos_trabalho tt', 'tt.id = t.id_tipo')->join('formatos f', 'f.id = t.id_formato', 'left outer')->join('submissores s', 's.id = t.id_submissor')->join('niveis n', 't.id_nivel = n.id');
    }
}