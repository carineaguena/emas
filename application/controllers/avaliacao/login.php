<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->load->model('Avaliadores');
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
		$data['title']   = 'Identificação do Avaliador';
		$data['content'] = 'identificacao_avaliador';

		$data['script_adicional'] = "
			$.validate();
		";

		//$this->session->keep_flashdata('origem');

		$this->load->view('simpletemplate', $data);
		//$this->load->view('template_avaliador', $data);
	}

	public function autenticar()
	{
		$this->_set_form_validation_rules();

		if (!$this->form_validation->run())
		{
			//$this->session->keep_flashdata('origem');
			$this->session->set_flashdata('erro', validation_errors());
			redirect(base_url() . 'avalicao/login/identificar');
		}

		$email            = $this->input->post('email');
		$senha            = $this->input->post('senha');

		if(!$avaliador = $this->Avaliadores->getByEmail($email))
		{
			$this->session->set_flashdata('erro', 'e-mail não encontrado.');
			//$this->session->keep_flashdata('origem');
			redirect(base_url().'avaliacao/login/identificar');
			return FALSE;
		}

		if($avaliador->senha != md5($senha))  //!(password_verify($senha, $avaliador->senha)))
		{
			$this->session->set_flashdata('erro', 'Senha inválida.');
			//$this->session->keep_flashdata('origem');
			redirect(base_url().'avaliacao/login/identificar');
			return FALSE;
		}

		$dados['ultimo_acesso'] = date('Y-m-d');

		$this->Avaliadores->update($avaliador->id, $dados);

		$avaliador->tipo = 'V';

		//log_message('INFO', 'Autenticação do usuário: ' . $usuario->nome);
		$this->auth->set_usuario_logado($avaliador);
		$origem = $this->session->flashdata('origem');
		if (!$origem) {
			$origem = 'avaliacao/sucesso';
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
		redirect(base_url().'avaliacao/login');
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

		$avaliador = $this->Avaliadores->getByEmail($email);

		if(!$avaliador) {
			$this->session->set_flashdata('erro', 'E-mail não cadastrado.');
			redirect(base_url() . 'avaliacao/login/esquecisenha');
		}

		$chave = $this->crypto->encode($avaliador->email);

		$link = base_url() . 'avaliacao/login/redefinirsenha/' . $chave . '/' . urlencode($avaliador->email);

		$message = "Clique no link abaixo e cadastre uma nova senha para acesso:\n\n$link\n\nAtenciosamente,\nComissão Organizadora\n" . $this->em->getEvent()->nome;

		$subject = 'Link para redefinição da senha de acesso - ' . $this->em->getEvent()->nome;

		$this->mailer->enviarEmail($avaliador->email, $subject, $message);

		$this->session->set_flashdata('msg', 'Uma mensagem foi enviada para seu e-mail com um link para a definição de uma nova senha de acesso.');

		redirect(base_url() . 'avaliacao/login/identificar');
	}

	public function redefinirsenha($chave, $email)
	{
		$email = urldecode($email);

		$avaliador = $this->Avaliadores->getByEmail($email);

		if(!$avaliador) {
			die('E-mail não cadastrado!');
		}

		if(!$this->crypto->match($email, $chave)) {
			die('Chave inválida!');
		}

		$data['title'] = 'Redefinição da senha de acesso';
		$data['content'] = 'redefinir_senha';
		$data['id'] = $avaliador->id;
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

		$avaliador = $this->Avaliadores->get($id);

		if(!$this->crypto->match($avaliador->email, $chave)) {
			die('Chave inválida!');
		}

		$senha = $this->input->post('senha');

		$dados['senha'] = md5($senha);

		$this->Avaliadores->update($avaliador->id, $dados);

		$this->session->set_flashdata('msg', 'Senha alterada com sucesso.');

		redirect(base_url() . 'avaliacao/login/identificar');
	}
}

/* End of file user.php */