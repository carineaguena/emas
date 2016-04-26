<?php

class Mailer
{
    private $ci;

    public function __construct()
    {
        $this->ci =& get_instance();
    }

    public function enviarEmail($dest, $subject, $message, $attachments = array())
    {
        $this->ci->load->library('email');
        $config['charset']  = 'utf-8';
        $config['wordwrap'] = TRUE;
        $config['type']     = 'text';
        $this->ci->email->initialize($config);

        $this->ci->email->from('fice@ifc-camboriu.edu.br', 'VI FICE - IFC-Camboriú');
        $this->ci->email->to($dest);
        $this->ci->email->subject($subject);
        $this->ci->email->message($message);

        if(is_array($attachments) && count($attachments) > 0) {
            foreach($attachments as $attachment) {
                $this->ci->email->attach($attachment);
            }
        }

        $this->ci->email->send();
    }
}