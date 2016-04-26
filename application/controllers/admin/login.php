<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->load->model('Usuarios');
		$this->load->library('crypto');
	}

	public function index()
	{
		$this->identificar();
	}

	public function identificar()
	{
		$erro = $this->session->flashdata('erro');
		if ($erro) {
			$data['erro'] = $erro;
		}
		$msg = $this->session->flashdata('msg');
		if ($msg) {
			$data['msg'] = $msg;
		}
		$data['event']   = $this->em->getEvent();
		$data['title']   = 'Identificação do Usuário';
		$data['content'] = 'identificacao_usuario';
		$data['module_title'] = 'Área administrativa';
		$data['module'] = 'admin';

		$data['script_adicional'] = "
			$.validate();
		";

		//$this->session->keep_flashdata('origem');

		$this->load->view('simpletemplate', $data);
	}

	public function autenticar()
	{
		$this->_set_form_validation_rules();

		if (!$this->form_validation->run())
		{
			//$this->session->keep_flashdata('origem');
			$this->session->set_flashdata('erro', validation_errors());
			redirect(base_url() . 'admin/login/identificar');
		}

		$login            = $this->input->post('login');
		$senha            = $this->input->post('senha');

		if(!$usuario = $this->Usuarios->getByLogin($login))
		{
			$this->session->set_flashdata('erro', 'login não encontrado.');
			//$this->session->keep_flashdata('origem');
			redirect(base_url().'admin/login/identificar');
			return FALSE;
		}

		if($usuario->senha != md5($senha))  //!(password_verify($senha, $submissor->senha)))
		{
			$this->session->set_flashdata('erro', 'Senha inválida.');
			//$this->session->keep_flashdata('origem');
			redirect(base_url().'admin/login/identificar');
			return FALSE;
		}

		$dados['ultimo_acesso'] = date('Y-m-d');

		$this->Usuarios->update($usuario->id, $dados);

		$usuario->tipo = 'A';

		//log_message('INFO', 'Autenticação do usuário: ' . $usuario->nome);
		$this->auth->set_usuario_logado($usuario);
		$origem = $this->session->flashdata('origem');
		if (!$origem) {
			$origem = 'admin/home';
		}
		redirect(base_url() . $origem);
		return TRUE;
	}

	private function _set_form_validation_rules()
	{
		$this->form_validation->set_rules('login', 'Login:', 'trim|required');
		$this->form_validation->set_rules('senha', 'Senha:', 'trim|required');
	}

	public function sair()
	{
		$this->session->sess_destroy();
		redirect(base_url().'admin/login');
	}

	public function esquecisenha()
	{
		$erro = $this->session->flashdata('erro');
		if ($erro) {
			$data['erro'] = $erro;
		}
		$data['title'] = 'Esqueci minha senha';
		$data['content'] = 'esqueci_senha';
		$data['event'] = $this->em->getEvent();
		$data['module_title'] = 'Área administrativa';
		$data['module'] = 'admin';

		$this->load->view('simpletemplate', $data);
	}

	public function processaresquecisenha()
	{
		$email = $this->input->post('email');

		$usuario = $this->Usuarios->getByEmail($email);

		if(!$usuario) {
			$this->session->set_flashdata('erro', 'E-mail não cadastrado.');
			redirect(base_url() . 'admin/login/esquecisenha');
		}

		$chave = $this->crypto->encode($usuario->email);

		$link = base_url() . 'admin/login/redefinirsenha/' . $chave . '/' . urlencode($usuario->email);

		$message = "Clique no link abaixo e cadastre uma nova senha para acesso:\n\n$link\n\nAtenciosamente,\nComissão Organizadora\n" . $this->em->getEvent()->nome;

		$subject = 'Link para redefinição da senha de acesso - ' . $this->em->getEvent()->nome;

		$this->mailer->enviarEmail($usuario->email, $subject, $message);

		$this->session->set_flashdata('msg', 'Uma mensagem foi enviada para seu e-mail com um link para a definição de uma nova senha de acesso.');

		redirect(base_url() . 'admin/login/identificar');
	}

	public function redefinirsenha($chave, $email)
	{
		$email = urldecode($email);

		$usuario = $this->Usuarios->getByEmail($email);

		if(!$usuario) {
			die('E-mail não cadastrado!');
		}

		if(!$this->crypto->match($email, $chave)) {
			die('Chave inválida!');
		}

		$data['title'] = 'Redefinição da senha de acesso';
		$data['content'] = 'redefinir_senha';
		$data['id'] = $usuario->id;
		$data['chave'] = $chave;
		$data['event'] = $this->em->getEvent();
		$data['module_title'] = 'Área administrativa';
		$data['module'] = 'admin';
		$data['additional_script'] = "
			$.formUtils.addValidator({
			  name : 'matchfield',
			  validatorFunction : function(value, \$el, config, language, \$form) {
			  	field_match = \$el.prop('data-match');

			  	if(value != $('#' . field_match).val()) {
			  		return false;
			  	}

			    return true;
			  },
			  errorMessage : 'Value of fields don't matches',
			  errorMessageKey: 'fieldsDontMatch'
			});

			$.validate();
		";

		$this->load->view('simpletemplate', $data);
	}

	public function alterarsenha()
	{
		$erro = $this->session->flashdata('erro');
		if($erro) {
			$data['erro'] = $erro;
		}

		$data['title'] = 'Alteração da senha de acesso';
		$data['content'] = 'alterar_senha';
		$data['link_nav'] = 'sistema';
		$data['user'] = $this->auth->get_usuario_logado();
		$data['event'] = $this->em->getEvent();
		$data['module_title'] = 'Área administrativa';
		$data['module'] = 'admin';
		$data['additional_script'] = "
			$.formUtils.addValidator({
			  name : 'matchfield',
			  validatorFunction : function(value, \$el, config, language, \$form) {
			  	field_match = \$el.prop('data-match');

			  	if(value != $('#' . field_match).val()) {
			  		return false;
			  	}

			    return true;
			  },
			  errorMessage : 'Value of fields don't matches',
			  errorMessageKey: 'fieldsDontMatch'
			});

			$.validate();
		";

		$this->load->view('template_admin', $data);
	}

	public function gravarnovasenha()
	{
		$senha = $this->input->post('senha');
		$confirma_senha = $this->input->post('confirma_senha');

		if($senha != $confirma_senha) {
			$this->session->set_flashdata('erro', 'A senha e a confirmação digitadas não conferem.');
			redirect(base_url() . 'admin/login/alterarsenha');
		}

		$usuario_logado = $this->auth->get_usuario_logado();

		$usuario = $this->Usuarios->get($usuario_logado->id_usuario);

		$dados['senha'] = md5($senha);

		$this->Usuarios->update($usuario->id, $dados);

		redirect(base_url() . 'admin/home');
	}

	public function atualizarsenha()
	{
		$id = $this->input->post('id');
		$chave = $this->input->post('chave');

		$usuario = $this->Usuarios->get($id);

		if(!$this->crypto->match($usuario->email, $chave)) {
			die('Chave inválida!');
		}

		$senha = $this->input->post('senha');

		$dados['senha'] = md5($senha);

		$this->Usuarios->update($usuario->id, $dados);

		$this->session->set_flashdata('msg', 'Senha alterada com sucesso.');

		redirect(base_url() . 'admin/login/identificar');
	}
}

/* End of file user.php */