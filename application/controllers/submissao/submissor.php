<?php

class Submissor extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->model('Municipios');
        $this->load->model('Instituicoes');
        $this->load->model('Submissores');
        $this->load->library('crypto');
    }

    public function index()
    {
        redirect(base_url() . 'submissao/submissor/precadastro');
    }

    public function precadastro()
    {
        $erro = $this->session->flashdata('erro');
        if ($erro) {
            $data['erro'] = $erro;
        }
        $data['event'] = $this->em->getEvent();
        $data['title'] = 'Pré-cadastro de submissor';
        $data['content'] = 'form_precadastro';
        $data['additional_script'] = "
            function validaForm()
            {
                if($('#email').val().indexOf('sample') > -1 ||
                    $('#email').val().indexOf('email.tst') > -1) {
                    alert('e-mail inválido!');
                    return false;
                }
                else {
                    $.ajax({
                        url: url_base + 'submissao/submissor/verificaremail',
                        type: 'post', // método de envio dos dados (POST, GET)
                        data: {email: $('#email').val()},
                        dataType: 'json',
                        success: function(json) {
                            if(json.jacadastrado == 'S') {
                                alert('O e-mail informado já está cadastrado.');
                            }
                            else {
                                $('#form').prop('action', url_base + 'submissao/submissor/processarprecadastro');
                                $('#form').submit();
                            }
                        },
                        error: function(xhr, errorMessage) { // função a ser executada em caso de erro na requisição
                            alert('Erro na verificação do e-mail. Tente novamente.');
                            return false;
                        }
                    });
                }
            }
        ";

        $this->load->view('simpletemplate', $data);
    }

    public function processarprecadastro()
    {
        $this->form_validation->set_rules('email', 'e-mail', 'required|valid_email');

        if (!$this->form_validation->run()) {
            $this->session->set_flashdata('erro', 'E-mail inválido. Tente novamente.');
            redirect(base_url() . 'submissao/submissor/precadastro');
        }

        $email = $this->input->post('email');

        $submissor = $this->Submissores->getByEmail($email);

        if ($submissor) {
            $this->session->set_flashdata('erro', 'E-mail já cadastrado.');
            redirect(base_url() . 'submissao/submissor/precadastro');
        }

        $chave = $this->crypto->encode($email);

        $link = base_url() . 'submissao/submissor/novo/' . urlencode($email) . '/' . $chave;

        //die($link);

        $message = "Acesse o link abaixo e complete seu cadastro como submissor:\n\n$link\n\nAtenciosamente,\nComissão Organizadora\nVI FICE - IFC-Camboriú";
        $subject = 'Cadastro como submissor de trabalhos da VI FICE do IFC-Camboriú';

        $this->mailer->enviarEmail($email, $subject, $message);

        $this->exibeConfirmacaoCadastro();
    }

    public function novo($email = '', $chave = '')
    {
        if (!$email || !$chave) {
            redirect(base_url() . 'submissao/submissor/precadastro');
        }

        $email = urldecode($email);

        if (!$this->crypto->match($email, $chave)) {
            $this->exibeErroLink();
        }
        else {
            $this->exibeFormCadastro($email, $chave);
        }
    }

    public function alterar()
    {

    }

    public function gravar()
    {
        $this->setFormValidationRules();

        if (!$this->form_validation->run()) {
            $this->session->set_flashdata('erro', validation_errors());
            if (!$this->input->post('id')) {
                redirect(base_url() . 'submissao/submissor/novo/' . $this->input->post('email') . '/' . $this->input->post('chave'));
            }
            else {
                redirect(base_url() . 'submissao/submissor/alterar' . $this->input->post('id'));
            }
        }

        $this->executarGravacao();
    }

    public function confirmagravacao()
    {
        $erro = $this->session->flashdata('erro');
        if ($erro) {
            $data['erro'] = $erro;
        }
        $data['event'] = $this->em->getEvent();
        $data['title'] = 'Confirmação de gravação de dados';
        $data['content'] = 'confirmacao_submissor';

        $this->load->view('simpletemplate', $data);
    }

    private function setFormValidationRules()
    {
        $this->form_validation->set_rules('nome', 'Nome', 'required');
        $this->form_validation->set_rules('email', 'e-mail', 'required|valid_email');
        $this->form_validation->set_rules('id_instituicao', 'Instituição', 'required');
        $this->form_validation->set_rules('id_municipio', 'Município', 'required');
        $this->form_validation->set_rules('senha', 'Senha', 'required|min_length[6]');
        $this->form_validation->set_rules('confirma_senha', 'Confirmação da senha', 'required|matches[senha]');
    }

    private function executarGravacao()
    {
        $data['nome'] = $this->input->post('nome');
        $data['email'] = $this->input->post('email');
        $data['id_instituicao'] = $this->input->post('id_instituicao');
        $data['id_municipio'] = $this->input->post('id_municipio');
        $data['senha'] = md5($this->input->post('senha'));

        $id = $this->input->post('id');

        if(!$id) {
            $data['data_cadastro'] = date('Y-m-d');

            if(!$this->Submissores->insert($data)) {
                $this->session->set_flashdata('erro', 'Não foi possível inserir. Tente novamente.');
                redirect(base_url() . 'submissao/submissor/novo/' . $data['email'] . '/' . $this->input->post('chave'));
            }

            $event = $this->em->getEvent();

            $this->mailer->enviarEmail($data['email'], 'Confirmação de cadastro como submissor - ' . $event->nome, "Prezado(a) {$data['nome']},\n\nConfirmamos seu cadastro como submissor de trabalhos.\n\nAtenciosamente,\nComissão Organizadora - " . $event->nome);

            $id = $this->Submissores->getInsertId();
            $this->session->set_userdata('login_usuario', $submissor->nome);
        }
        else {
            if(!$this->Submissores->update($id, $data)) {
                $this->session->set_flashdata('erro', 'Não foi possível alterar. Tente novamente.');
                redirect(base_url() . 'submissao/submissor/alterar');
            }
        }

        $submissor = $this->Submissores->get($id);
        $this->auth->set_usuario_logado($submissor);

        redirect(base_url() . 'submissao/trabalho');
    }

    private function exibeConfirmacaoCadastro()
    {
        $data['title'] = 'Pré-cadastro de submissor';
        $data['event'] = $this->em->getEvent();
        $data['content'] = 'confirma_precadastro';

        $this->load->view('simpletemplate', $data);
    }

    private function exibeErroLink()
    {
        $data['title'] = 'Erro no link de cadastro';
        $data['event'] = $this->em->getEvent();
        $data['content'] = 'erro_link';

        $this->load->view('simpletemplate', $data);
    }

    private function exibeFormCadastro($email, $chave)
    {
        $erro = $this->session->flashdata('erro');
        if ($erro) {
            $data['erro'] = $erro;
        }
        $data['title'] = 'Cadastro de submissor de trabalhos';
        $data['event'] = $this->em->getEvent();
        $data['content'] = 'form_submissor';
        $data['instituicoes'] = $this->Instituicoes->getAll();
        $data['municipios'] = $this->Municipios->getAll();
        $data['email'] = $email;
        $data['chave'] = $chave;

        $data['scripts'] = array('submissores', 'instituicoes', 'municipios');

        $this->load->view('simpletemplate', $data);
    }

    public function verificaremail()
    {
        $email = $this->input->post('email');

        $submissor = $this->Submissores->getByEmail($email);

        $retorno['jacadastrado'] = isset($submissor->id) ? 'S' : 'N';

        header('content-type: text/json; charset=utf-8');
        echo json_encode($retorno);
    }
}