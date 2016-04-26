<?php

class CI_Session
{
    private $ci;

    public function __construct()
    {
        $this->ci =& get_instance();
    }

    public function set_userdata($id, $value)
    {
        $_SESSION[$id] = $value;
    }

    public function userdata($id)
    {
        return isset($_SESSION[$id]) ? $_SESSION[$id] : false;
    }

    public function set_flashdata($id, $value)
    {
        $this->set_userdata($id, $value);
    }

    public function flashdata($id)
    {
        $retorno = isset($_SESSION[$id]) ? $_SESSION[$id] : false;
        unset($_SESSION[$id]);
        return $retorno;
    }

    public function sess_destroy()
    {
        foreach($_SESSION as $chave => $valor) {
            unset($_SESSION[$chave]);
        }
    }
}