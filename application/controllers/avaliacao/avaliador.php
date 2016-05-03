<?php

class Avaliador extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->model('Municipios');
        $this->load->model('Instituicoes');
        $this->load->model('Avaliadores');
        $this->load->library('crypto');
    }

    public function index()
    {
        redirect(base_url() . 'avaliacao/avaliador/precadastro');
    }

    public function precadastro()
    {
        $erro = $this->session->flashdata('erro');
        if ($erro) {
            $data['erro'] = $erro;
        }
        $data['event'] = $this->em->getEvent();
        $data['title'] = 'Pré-cadastro de avaliador';
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
                        url: url_base + 'avaliacao/avaliador/verificaremail',
                        type: 'post', // método de envio dos dados (POST, GET)
                        data: {email: $('#email').val()},
                        dataType: 'json',
                        success: function(json) {
                            if(json.jacadastrado == 'S') {
                                alert('O e-mail informado já está cadastrado.');
                            }
                            else {
                                $('#form').prop('action', url_base + 'avaliacao/avaliador/processarprecadastro');
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
            redirect(base_url() . 'avaliacao/avaliador/precadastro');
        }

        $email = $this->input->post('email');

        $avaliador = $this->Avaliadores->getByEmail($email);

        if ($avaliador) {
            $this->session->set_flashdata('erro', 'E-mail já cadastrado.');
            redirect(base_url() . 'avaliacao/avaliador/precadastro');
        }

        $chave = $this->crypto->encode($email);

        $link = base_url() . 'avaliacao/avaliador/novo/' . urlencode($email) . '/' . $chave;

        //die($link);

        $message = "Acesse o link abaixo e complete seu cadastro como avaliador:\n\n$link\n\nAtenciosamente,\nComissão Organizadora\nVII FICE - IFC-Camboriú";
        $subject = 'Cadastro como avaliador de trabalhos da VII FICE do IFC-Camboriú';

        $this->mailer->enviarEmail($email, $subject, $message);

        $this->exibeConfirmacaoCadastro();
    }

    public function novo($email = '', $chave = '')
    {
        if (!$email || !$chave) {
            redirect(base_url() . 'avaliacao/avaliador/precadastro');
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
                redirect(base_url() . 'avaliacao/avaliador/novo/' . $this->input->post('email') . '/' . $this->input->post('chave'));
            }
            else {
                redirect(base_url() . 'avaliacao/avaliador/alterar' . $this->input->post('id'));
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
        $data['content'] = 'confirmacao_avaliador';

        $this->load->view('simpletemplate', $data);
    }

    private function setFormValidationRules()
    {
        $this->form_validation->set_rules('nome', 'Nome', 'required');
        $this->form_validation->set_rules('titulacao', 'Titulacao', 'required');
        $this->form_validation->set_rules('email', 'e-mail', 'required|valid_email');
        $this->form_validation->set_rules('id_instituicao', 'Instituição', 'required');
        $this->form_validation->set_rules('id_municipio', 'Município', 'required');
        $this->form_validation->set_rules('senha', 'Senha', 'required|min_length[6]');
        $this->form_validation->set_rules('confirma_senha', 'Confirmação da senha', 'required|matches[senha]');
    }

    private function executarGravacao()
    {
        //grava no banco os dados passados pelo arquivo form_avaliador
        $data['nome'] = $this->input->post('nome');
        $data['email'] = $this->input->post('email');
        $data['id_instituicao'] = $this->input->post('id_instituicao');
        $data['id_municipio'] = $this->input->post('id_municipio');
        $data['senha'] = md5($this->input->post('senha'));
        $data['titulacao'] = $this->input->post('titulacao');
        
        foreach ($this->input->post('areas') as $value) {
            $array = $value . ';' .  $array;
        }

        $data['areas'] = $array;

        foreach ($this->input->post('horarios') as $value_h) {
            $array_h = $value_h . ';' .  $array_h;
        }

        $data['horarios'] = $array_h;

        $data['telefone'] = $this->input->post('telefone');

      
        $id = $this->input->post('id');

        if(!$id) {
            $data['data_cadastro'] = date('Y-m-d');

            if(!$this->Avaliadores->insert($data)) {
                $this->session->set_flashdata('erro', 'Não foi possível inserir. Tente novamente.');
                redirect(base_url() . 'avaliacao/avaliador/novo/' . $data['email'] . '/' . $this->input->post('chave'));
            }

            $event = $this->em->getEvent();

            $this->mailer->enviarEmail($data['email'], 'Confirmação de cadastro como avaliador - ' . $event->nome, "Prezado(a) {$data['nome']},\n\nConfirmamos seu cadastro como avaliador de trabalhos.\n\nAtenciosamente,\nComissão Organizadora - " . $event->nome);

            $id = $this->Avaliadores->getInsertId();
            $this->session->set_userdata('login_usuario', $avaliador->nome);
        }
        else {
            if(!$this->Avaliadores->update($id, $data)) {
                $this->session->set_flashdata('erro', 'Não foi possível alterar. Tente novamente.');
                redirect(base_url() . 'avaliacao/avaliador/alterar');
            }
        }

        $avaliador = $this->Avaliadores->get($id);
        $this->auth->set_usuario_logado($avaliador);

        redirect(base_url() . 'avaliacao/sucesso');
    }

    private function exibeConfirmacaoCadastro()
    {
        $data['title'] = 'Pré-cadastro de avaliador';
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
        $data['title'] = 'Cadastro de avaliador de trabalhos';
        $data['event'] = $this->em->getEvent();
        $data['content'] = 'form_avaliador';
        $data['instituicoes'] = $this->Instituicoes->getAll();
        $data['municipios'] = $this->Municipios->getAll();
        $data['email'] = $email;
        $data['chave'] = $chave;

        $data['scripts'] = array('avaliadores', 'instituicoes', 'municipios');

        $this->load->view('simpletemplate', $data);
    }

    public function verificaremail()
    {
        $email = $this->input->post('email');

        $avaliador = $this->Avaliadores->getByEmail($email);

        $retorno['jacadastrado'] = isset($avaliador->id) ? 'S' : 'N';

        header('content-type: text/json; charset=utf-8');
        echo json_encode($retorno);
    }
}