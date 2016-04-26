<?php

class Auth
{
	private $_ci;

	public function __construct()
	{
		$this->_erro = '';
		$this->_ci   =& get_instance();
	}

	public function verificar_login($modulo)
	{
		$modulos = array('A' => 'admin', 'S' => 'submissao', 'V' => 'avaliacao', '' => 'indefinido');

		$login = $this->_ci->session->userdata('login_usuario');
		$tipo  = $this->_ci->session->userdata('tipo_usuario');

		if ($login && $modulo == $modulos[$tipo])
		{
			return TRUE;
		}

		$this->_ci->session->set_flashdata('origem', substr($_SERVER['PATH_INFO'], 1, strlen($_SERVER['PATH_INFO'])));

		redirect(base_url() . $modulo . '/login/identificar');
	}

	public function validar_tipo_usuario($tipo)
	{
		$tipo_usuario = $this->_ci->session->userdata('tipo_usuario');

		if ($tipo_usuario == $tipo)
		{
			return TRUE;
		}

		$data['conteudo'] = 'naoautorizado';
		$data['titulo']   = 'Acesso não autorizado';
		$data['usuario']    = $this->get_usuario_logado();
	}

	public function get_usuario_logado()
	{
		$usuario                = new stdClass;
		$usuario->id_usuario    = $this->_ci->session->userdata('id_usuario');
		$usuario->nome_usuario  = $this->_ci->session->userdata('nome_usuario');
		$usuario->login_usuario = $this->_ci->session->userdata('login_usuario');
		$usuario->email_usuario = $this->_ci->session->userdata('email_usuario');
		$usuario->tipo          = $this->_ci->session->userdata('tipo_usuario');

		return $usuario;
	}

	public function set_usuario_logado($usuario)
	{
		$this->_ci->session->set_userdata('id_usuario', $usuario->id);
		$this->_ci->session->set_userdata('nome_usuario', $usuario->nome);
		$this->_ci->session->set_userdata('login_usuario', isset($usuario->login) ? $usuario->login : (strpos($usuario->nome, ' ') ? substr($usuario->nome, 0, strpos($usuario->nome, ' ')): $usuario->nome));
		$this->_ci->session->set_userdata('email_usuario', $usuario->email);
		$this->_ci->session->set_userdata('tipo_usuario', $usuario->tipo);

		return TRUE;
	}
}

/* End of file auth.php */