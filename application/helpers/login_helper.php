<?php
    function verificar_login() {
        $CI = & get_instance();

        if( $CI->session->userdata('login') ) {
            return TRUE;
        }
        else {
            $origem = str_replace( '/', '\\', $_SERVER['REQUEST_URI'] );

            $CI->session->set_flashdata( 'origem', $origem );
            
            redirect( base_url() . 'admin/auth/identificar/' );
        }
    }
    
    function get_usuario_logado() {
        $CI = & get_instance();

        $dados_usuario = array();
        
        $dados_usuario['login'] = $CI->session->userdata('login');
        $dados_usuario['email'] = $CI->session->userdata('email');
        $dados_usuario['nome'] = $CI->session->userdata('nome');
        $dados_usuario['id'] = $CI->session->userdata('id');
        
        return $dados_usuario;
    }
?>