<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->load->model('Submissores');
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
		$data['title']   = 'Identificação do Submissor';
		$data['content'] = 'identificacao_submissor';

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
			redirect(base_url() . 'submissao/login/identificar');
		}

		$email            = $this->input->post('email');
		$senha            = $this->input->post('senha');

		if(!$submissor = $this->Submissores->getByEmail($email))
		{
			$this->session->set_flashdata('erro', 'e-mail não encontrado.');
			//$this->session->keep_flashdata('origem');
			redirect(base_url().'submissao/login/identificar');
			return FALSE;
		}

		if($submissor->senha != md5($senha))  //!(password_verify($senha, $submissor->senha)))
		{
			$this->session->set_flashdata('erro', 'Senha inválida.');
			//$this->session->keep_flashdata('origem');
			redirect(base_url().'submissao/login/identificar');
			return FALSE;
		}

		$dados['ultimo_acesso'] = date('Y-m-d');

		$this->Submissores->update($submissor->id, $dados);

		$submissor->tipo = 'S';

		//log_message('INFO', 'Autenticação do usuário: ' . $usuario->nome);
		$this->auth->set_usuario_logado($submissor);
		$origem = $this->session->flashdata('origem');
		if (!$origem) {
			$origem = 'submissao/trabalho';
		}
		redirect(base_url() . $origem);
		return TRUE;
	}

	private function _set_form_validation_rules()
	{
		$this->form_validation->set_rules('email', 'e-mail:', 'trim|required|valid_email');
		$this->form_validation->set_rules('senha', 'Senha:', 'trim|required');
	}

	public function sair()
	{
		$this->session->sess_destroy();
		redirect(base_url().'submissao/login');
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

		$this->load->view('simpletemplate', $data);
	}

	public function processaresquecisenha()
	{
		$email = $this->input->post('email');

		$submissor = $this->Submissores->getByEmail($email);

		if(!$submissor) {
			$this->session->set_flashdata('erro', 'E-mail não cadastrado.');
			redirect(base_url() . 'submissao/login/esquecisenha');
		}

		$chave = $this->crypto->encode($submissor->email);

		$link = base_url() . 'submissao/login/redefinirsenha/' . $chave . '/' . urlencode($submissor->email);

		$message = "Clique no link abaixo e cadastre uma nova senha para acesso:\n\n$link\n\nAtenciosamente,\nComissão Organizadora\n" . $this->em->getEvent()->nome;

		$subject = 'Link para redefinição da senha de acesso - ' . $this->em->getEvent()->nome;

		$this->mailer->enviarEmail($submissor->email, $subject, $message);

		$this->session->set_flashdata('msg', 'Uma mensagem foi enviada para seu e-mail com um link para a definição de uma nova senha de acesso.');

		redirect(base_url() . 'submissao/login/identificar');
	}

	public function redefinirsenha($chave, $email)
	{
		$email = urldecode($email);

		$submissor = $this->Submissores->getByEmail($email);

		if(!$submissor) {
			die('E-mail não cadastrado!');
		}

		if(!$this->crypto->match($email, $chave)) {
			die('Chave inválida!');
		}

		$data['title'] = 'Redefinição da senha de acesso';
		$data['content'] = 'redefinir_senha';
		$data['id'] = $submissor->id;
		$data['chave'] = $chave;
		$data['event'] = $this->em->getEvent();
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

	}

	public function atualizarsenha()
	{
		$id = $this->input->post('id');
		$chave = $this->input->post('chave');

		$submissor = $this->Submissores->get($id);

		if(!$this->crypto->match($submissor->email, $chave)) {
			die('Chave inválida!');
		}

		$senha = $this->input->post('senha');

		$dados['senha'] = md5($senha);

		$this->Submissores->update($submissor->id, $dados);

		$this->session->set_flashdata('msg', 'Senha alterada com sucesso.');

		redirect(base_url() . 'submissao/login/identificar');
	}
}

/* End of file user.php */