<?php

class Em
{
    private $ci;
    private $currentEvent;

    public function __construct()
    {
        $this->ci =& get_instance();
        $this->ci->load->model('Eventos');
        $this->ci->config->load('evento');
        $this->currentEvent = $this->ci->config->item('currentEvent');
    }

    public function getEvent()
    {
        return $this->ci->Eventos->get($this->currentEvent);
    }
}