<?php

class Trabalho extends CI_Controller
{
    private $erro_upload;

    public function __construct()
    {
        parent::__construct();

        $this->auth->verificar_login('submissao');

        $this->load->model('Areas');
        $this->load->model('Categorias');
        $this->load->model('Niveis');
        $this->load->model('Formatos');
        $this->load->model('Tipostrabalho');
        $this->load->model('Trabalhos');
        $this->load->model('Instituicoes');
        $this->load->model('Autores');
        $this->load->model('Arquivos');
    }

    public function index()
    {
        $erro = $this->session->flashdata('erro');
        if ($erro) {
            $data['erro'] = $erro;
        }
        $msg = $this->session->flashdata('msg');
        if ($msg) {
            $data['msg'] = $msg;
        }
        $data['user'] = $this->auth->get_usuario_logado();
        $data['event'] = $this->em->getEvent();
        $data['title'] = 'Home';
        $data['content'] = 'lista_trabalhos';
        $data['trabalhos'] = $this->Trabalhos->getBySubmissor($data['event']->id, $data['user']->id_usuario);

        $data['additional_script'] = "
            $('#listagem').dataTable({
                    \"order\": [ 1, 'asc' ],
                    \"paging\": false,
                    \"searching\": false,
                    \"columnDefs\": [
                        { \"orderable\": false, \"targets\": [7] }
                ]
            });
        ";
        $data['scripts'] = array('trabalhos');

        $this->load->view('template', $data);
    }

    public function novo()
    {
        $trabalho = $this->session->flashdata('trabalho');
        if($trabalho) {
            $data['trabalho'] = $trabalho;
        }
        $erro = $this->session->flashdata('erro');
        if ($erro) {
            $data['erro'] = $erro;
        }
        $evento = $this->em->getEvent();
        $data['user'] = $this->auth->get_usuario_logado();
        $data['event'] = $evento;
        $data['title'] = 'Submissão de trabalho';
        $data['content'] = 'prazo_submissao_expirado';//'form_trabalho';
        $data['categorias'] = $this->Categorias->getAll($evento->id);
        $data['niveis'] = $this->Niveis->getAll($evento->id);
        $data['tipos'] = $this->Tipostrabalho->getAll($evento->id);
        $data['instituicoes'] = $this->Instituicoes->getAll();
        if($trabalho) {
            $data['areas'] = $this->Areas->getByCategoria($evento->id, $trabalho->id_area);
            $data['formato'] = $this->Formatos->getByNivelTipo($trabalho->id_nivel, $trabalho->id_tipo)->descricao;
        }

        $data['scripts'] = array('trabalhos', 'instituicoes');

        $this->load->view('template', $data);
    }

    public function alterar($id)
    {
        $erro = $this->session->flashdata('erro');
        if ($erro) {
            $data['erro'] = $erro;
        }
        $evento = $this->em->getEvent();
        $data['user'] = $this->auth->get_usuario_logado();
        $data['event'] = $evento;
        $data['trabalho'] = $this->Trabalhos->get($id);
        $data['title'] = 'Alteração de dados do trabalho';
        $data['content'] = 'prazo_submissao_expirado';//'form_trabalho';
        $data['instituicoes'] = $this->Instituicoes->getAll();
        $data['categorias'] = $this->Categorias->getAll($evento->id);
        $data['tipos'] = $this->Tipostrabalho->getAll($evento->id);
        $data['niveis'] = $this->Niveis->getAll($evento->id);
        $data['areas'] = $this->Areas->getByCategoria($evento->id, $data['trabalho']->id_categoria);
        $formato = $this->Formatos->getByNivelTipo($data['trabalho']->id_nivel, $data['trabalho']->id_tipo);
        if($formato) {
          $data['formato'] = $formato->descricao;
        }
        $data['autores'] = $this->Autores->getBytrabalho($data['trabalho']->id);

        $data['scripts'] = array('trabalhos', 'instituicoes');

        $this->load->view('template', $data);
    }

    public function gravar()
    {
        die();

        $this->setValidationRules();

        if(!$this->form_validation->run()) {
            $this->session->set_flashdata('erro', validation_errors());
            redirect(base_url() . 'submissao/trabalho');
        }

        $data = $this->getPostData();

        if(!$this->input->post('id')) {
            $data['id_submissor'] = $this->auth->get_usuario_logado()->id_usuario;
            if(!$this->Trabalhos->insert($data)) {
                $this->session->set_flashdata('erro', 'Não foi possível incluir o trabalho. Tente novamente.');
                $this->session->set_flashdata('trabalho', serialize($this->getTrabalhoObj()));
                redirect(base_url() . 'submissao/trabalho/novo');
            }

            $id = $this->Trabalhos->getInsertId();

            $numero_autores = $this->input->post('numero_autores');

            for($a = 1; $a <= $numero_autores; $a++) {
                $nome_autor = $this->input->post('nome_autor' . $a);
                $email_autor = $this->input->post('email_autor' . $a);
                $instituicao_autor = $this->input->post('instituicao_autor' . $a);

                if($nome_autor && $email_autor) {
                    $data = array();
                    $data['nome'] = $nome_autor;
                    $data['email'] = $email_autor;
                    $data['id_trabalho'] = $id;
                    $data['id_instituicao'] = $instituicao_autor;

                    $this->Autores->insert($data);
                }
            }

            $erros = '';

            foreach(array('doc', 'pdf') as $tipoArquivo) {
                if($arquivo = $this->process_upload($tipoArquivo, $id)) {
                    $data = array();
                    $data['data_submissao'] = date('Y-m-d');
                    $data['hora_submissao'] = date('h:n:s');
                    $data['nome_arquivo'] = $arquivo;
                    $data['id_trabalho'] = $id;
                    $data['tipo_arquivo'] = $tipoArquivo;

                    if(!$this->Arquivos->insert($data)) {
                        $erros .= 'Erro na gravação do arquivo "' . $tipoArquivo . '".<br>';
                    }
                }
                else {
                    $erros .= 'Erro no upload do arquivo "' . $tipoArquivo . '".<br>';
                }
            }

            $trabalho = $this->Trabalhos->get($id);
            $submissor = $this->auth->get_usuario_logado();
            $evento = $this->em->getEvent();

            $message = "Prezado(a) " . $submissor->nome_usuario . ",\n\nSeu trabalho \"" . $trabalho->titulo . "\" foi submetido com sucesso.\n\nAtenciosamente,\nComissão Organizadora\n" . $evento->nome;

            $this->mailer->enviarEmail($submissor->email_usuario, 'Confirmação de submissão de trabalho - ' . $evento->nome, $message);

            $this->session->set_flashdata('erro', $erros);
            $msg = 'Os dados do trabalho foram gravados com sucesso.';
        }
        else {
            $data['data_ultima_alteracao'] = date('Y-m-d');
            if(!$this->Trabalhos->update($this->input->post('id'), $data)) {
                $this->session->set_flashdata('erro', 'Não foi possível alterar o trabalho. Tente novamente.');
                redirect(base_url() . 'submissao/trabalho/alterar/' . $this->input->post('id'));
            }

            $msg = 'Os dados do trabalho foram alterados com sucesso.';
        }

        $this->session->set_flashdata('msg', $msg);
        redirect(base_url(). 'submissao/trabalho');
    }

    public function processareenvio()
    {
        redirect(base_url() . 'submissao/trabalho');

        $id = $this->input->post('id');

        foreach(array('doc', 'pdf') as $tipoArquivo) {
            if($arquivo = $this->process_upload($tipoArquivo, $id)) {
                $data = array();
                $data['data_submissao'] = date('Y-m-d');
                $data['hora_submissao'] = date('h:n:s');
                $data['nome_arquivo'] = $arquivo;
                $data['id_trabalho'] = $id;
                $data['tipo_arquivo'] = $tipoArquivo;

                if(!$this->Arquivos->insert($data)) {
                    $erros .= 'Erro na gravação do arquivo "' . $tipoArquivo . '".<br>';
                }
            }
            else {
                $erros .= 'Erro no upload do arquivo "' . $tipoArquivo . '".<br>';
            }
        }

        if($erros) {
            $this->session->set_flashdata('erro', $erros);
        }
        else {
            $this->session->set_flashdata('msg', 'Reenvio de arquivos bem sucedido.');
        }

        redirect(base_url() . 'submissao/trabalho');
    }

    private function getPostData()
    {
        $data = array();
        $data['titulo'] = $this->input->post('titulo');
        $data['resumo'] = $this->input->post('resumo');
        $data['nome_orientador'] = $this->input->post('nome_orientador');
        $data['email_orientador'] = $this->input->post('email_orientador');
        $data['nome_coorientador1'] = $this->input->post('nome_coorientador1');
        $data['email_coorientador1'] = $this->input->post('email_coorientador1');
        $data['nome_coorientador2'] = $this->input->post('nome_coorientador2');
        $data['email_coorientador2'] = $this->input->post('email_coorientador2');
        $data['id_categoria'] = $this->input->post('id_categoria');
        $data['id_area'] = $this->input->post('id_area');
        $data['id_tipo'] = $this->input->post('id_tipo');
        $data['id_modalidade'] = $this->input->post('id_modalidade');
        $data['id_nivel'] = $this->input->post('id_nivel');
        if ($this->input->post('id_formato')) {
            $data['id_formato'] = $this->input->post('id_formato');
        }
        $data['id_evento'] = $this->em->getEvent()->id;

        return $data;
    }

    private function getTrabalhoObj()
    {
        $trabalho = new StdClass;
        $trabalho->titulo = $this->input->post('titulo');
        $trabalho->resumo = $this->input->post('resumo');
        $trabalho->nome_orientador = $this->input->post('nome_orientador');
        $trabalho->email_orientador = $this->input->post('email_orientador');
        $trabalho->nome_coorientador1 = $this->input->post('nome_coorientador1');
        $trabalho->email_coorientador1 = $this->input->post('email_coorientador1');
        $trabalho->nome_coorientador2 = $this->input->post('nome_coorientador2');
        $trabalho->email_coorientador2 = $this->input->post('email_coorientador2');
        $trabalho->id_categoria = $this->input->post('id_categoria');
        $trabalho->id_area = $this->input->post('id_area');
        $trabalho->id_tipo = $this->input->post('id_tipo');
        $trabalho->id_modalidade = $this->input->post('id_modalidade');
        $trabalho->id_formato = $this->input->post('id_formato');

        return $trabalho;
    }

    private function setValidationRules()
    {
        $this->form_validation->set_rules('titulo', 'Título', 'required');
        $this->form_validation->set_rules('resumo', 'Resumo', 'required');
        $this->form_validation->set_rules('id_categoria', 'Categoria', 'required');
        $this->form_validation->set_rules('id_area', 'Área', 'required');
        $this->form_validation->set_rules('id_tipo', 'Tipo de trabalho', 'required');
        $this->form_validation->set_rules('id_modalidade', 'Modalidade', 'required');
    }

    private function process_upload($fileType, $id) {
        if ( is_uploaded_file( $_FILES['arquivo_' . $fileType]['tmp_name'] ) ) {
            $fileName = $this->mount_filename($fileType, $id);
            if ( !$this->do_upload($fileName, $fileType) ) {
                die($this->erro_upload);
            }
            else {
                return $fileName;
            }
        }
        else {
            return '';
        }
    }

    private function mount_filename($fileType, $id) {
        $pathinfo = pathinfo($_FILES['arquivo_' . $fileType]['name']);
        $nome_arq = 'trab' . str_pad($id, 4, '0', STR_PAD_LEFT) . '.' . $pathinfo['extension'];
        return $nome_arq;
    }

    private function do_upload( $fileName, $fileType ) {
        $allowFileTypes = array('doc' => 'doc|docx|odt', 'pdf' => 'pdf');
        $config['upload_path'] = FILES_PATH;
        $config['allowed_types'] = $allowFileTypes[$fileType];
        $config['file_name'] = $fileName;
        $config['overwrite'] = TRUE;

        $this->load->library( 'upload' );

        $this->upload->initialize($config);

        if ( $this->upload->do_upload( 'arquivo_' . $fileType ) ) {
            return TRUE;
        }
        else {
            $this->erro_upload = $this->upload->display_errors(); //'Problemas com a submissão do arquivo "' . $fileType . '".';
            return FALSE;
        }
      }

    public function download($id, $fileType) {
        $trabalho = $this->Model_trabalhos->get( $id );

        switch($fileType) {
            case 'doc':
                $path_to_file = '/var/www/htdocs/vfice2014/inscricao/uploads/' . $trabalho->trab_doc;
                $filename = $trabalho->trab_doc;
                break;
            case 'pdf':
                $path_to_file = '/var/www/htdocs/vfice2014/inscricao/uploads/' . $trabalho->trab_pdf;
                $filename = $trabalho->trab_pdf;
        }

        $this->load->helper('download');

        $content = file_get_contents($path_to_file);

        force_download($filename, $content);
    }
}
