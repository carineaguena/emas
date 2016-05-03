<?php

ini_set('display_errors', 'On');

class Trabalho extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->auth->verificar_login('admin');

        $this->load->model('Categorias');
        $this->load->model('Tipostrabalho');
        $this->load->model('Modalidades');
        $this->load->model('Areas');
        $this->load->model('Niveis');
        $this->load->model('Formatos');
        $this->load->model('Instituicoes');
        $this->load->model('Arquivos');
        $this->load->model('Autores');
        $this->load->model('Trabalhos');
    }

    public function index()
    {


        $trabalhos = $this->Trabalhos->getAll($this->em->getEvent()->id);

        $trabalhos = $this->complementaDados($trabalhos);

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
        $data['title'] = 'Trabalhos submetidos';
        $data['content'] = 'lista_trabalhos_submetidos';
        $data['module'] = 'admin';
        $data['link_nav'] = 'listagens';
        $data['trabalhos'] = $trabalhos;

        $data['additional_script'] = "
            $('#listagem').dataTable({
                    \"order\": [ 1, 'asc' ],
                    \"paging\": false,
                    \"columnDefs\": [
                        { \"orderable\": false, \"targets\": [7] }
                ]
            });
        ";


        $this->load->view('template_admin', $data);
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
        $data['content'] = 'form_trabalho';
        $data['link_nav'] = 'listagens';
        $data['module'] = 'admin';
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

        $this->load->view('template_admin', $data);
    }

    public function detalhes($id)
    {
        $trabalho = $this->Trabalhos->get($id);

        $evento = $this->em->getEvent();
        $data['user'] = $this->auth->get_usuario_logado();
        $data['event'] = $evento;
        $data['title'] = 'Detalhes do trabalho';
        $data['content'] = 'detalhes_trabalho';
        $data['link_nav'] = 'listagens';
        $data['module'] = 'admin';

        $trabalho->categoria = $this->Categorias->get($trabalho->id_categoria)->descricao;
        $trabalho->area = $this->Areas->get($trabalho->id_area)->nome;
        $trabalho->tipo = $this->Tipostrabalho->get($trabalho->id_tipo)->descricao;
        $trabalho->nivel = $this->Niveis->get($trabalho->id_nivel)->descricao;
        $trabalho->modalidade = $this->Modalidades->get($trabalho->id_modalidade)->descricao;
        $formato = $this->Formatos->getByNivelTipo($trabalho->id_nivel, $trabalho->id_tipo);
        if($formato) {
          $trabalho->formato = $formato->descricao;
        }

        $data['trabalho'] = $trabalho;
        $autores = $this->Autores->getBytrabalho($data['trabalho']->id);

        foreach($autores as $autor) {
            $autor->nome_instituicao = $this->Instituicoes->get($autor->id_instituicao)->nome;
        }

        $data['autores'] = $autores;

        $this->load->view('template_admin', $data);
    }

    public function excluir($id)
    {
        $arquivos = $this->Arquivos->getByTrabalho($id);

        foreach($arquivos as $arquivo) {
            unlink(FILES_PATH . $arquivo->nome_arquivo);
            $this->Arquivos->delete($arquivo->id);
        }

        $autores = $this->Autores->getByTrabalho($id);

        foreach($autores as $autor) {
            $this->Autores->delete($autor->id);
        }

        $this->Trabalhos->delete($id);

        redirect(base_url() . 'admin/trabalho');
    }

    public function generateCSV()
    {
        $this->load->library('ExportCSV');
        $this->exportcsv->setFileName('lista_trabalhos_submetidos.csv');
        $this->exportcsv->setHeaders(
            array(
                'Cód.', 'Título', 'Tipo', 'Categoria', 'Nível', 'Área', 'Modalidade', 'Formato',
                'Nome do orientador', 'e-mail do orientador', 'Nome do co-orientador', 'e-mail do co-orientador', 'Nome do co-orientador 2', 'e-mail do co-orientador 2',
                'Nome do submissor', 'Autores'
            )
        );

        $trabalhos = $this->Trabalhos->getAll($this->em->getEvent()->id);
        $trabalhos = $this->complementaDados($trabalhos);

        foreach ($trabalhos as $trabalho) {
            $autores = '';

            foreach($trabalho->autores as $autor) {
                $autores .= $autor->nome . ', ';
            }

            $autores = substr($autores, 0, strlen($autores) - 2);

            $this->exportcsv->addLine(
                array(
                    $trabalho->id, $trabalho->titulo, $trabalho->tipo, $trabalho->categoria, $trabalho->nivel,
                    $trabalho->area, $trabalho->modalidade, $trabalho->formato, $trabalho->nome_orientador, $trabalho->email_orientador, $trabalho->nome_coorientador1,
                    $trabalho->email_coorientador1, $trabalho->nome_coorientador2, $trabalho->email_coorientador2, $trabalho->submissor, $autores
                )
            );
        }

        $this->exportcsv->putContents();
    }

    public function generatePDF()
    {
        $trabalhos = $this->Trabalhos->getAll($this->em->getEvent()->id);

        $trabalhos = $this->complementaDados($trabalhos);

        $data['trabalhos'] = $trabalhos;

        $this->load->view('lista_trabalhos_submetidos_impressao', $data);

        $html = $this->output->get_output();

        // Load library
        $this->load->library('dompdf_gen');

        // Convert to PDF
        $this->dompdf->load_html($html);
        $this->dompdf->render();
        $this->dompdf->stream('lista_trabalhos_submetidos.pdf');
    }

    public function listaporarea()
    {
        $trabalhos = $this->Trabalhos->getAll($this->em->getEvent()->id, 'area');

        $data['trabalhos'] = $trabalhos;

        $this->load->view('lista_trabalhos_por_area', $data);

        $html = $this->output->get_output();

        // Load library
        $this->load->library('dompdf_gen');

        // Convert to PDF
        $this->dompdf->load_html($html);
        $this->dompdf->render();
        $this->dompdf->stream('lista_trabalhos_por_area.pdf');
    }

    public function listapormodalidade()
    {
        $trabalhos = $this->Trabalhos->getAll($this->em->getEvent()->id, 'modalidade, formato, area, titulo');

        $data['trabalhos'] = $trabalhos;

        $this->load->view('lista_trabalhos_por_modalidade', $data);

        $html = $this->output->get_output();

        // Load library
        $this->load->library('dompdf_gen');

        // Convert to PDF
        $this->dompdf->load_html($html);
        $this->dompdf->render();
        $this->dompdf->stream('lista_trabalhos_por_modalidade.pdf');
    }

    public function listaporcategoria()
    {
        $trabalhos = $this->Trabalhos->getAll($this->em->getEvent()->id, 'categoria, nivel, tipo, formato, area, titulo');

        $data['trabalhos'] = $trabalhos;

        $this->load->view('lista_trabalhos_por_categoria', $data);

        $html = $this->output->get_output();

        // Load library
        $this->load->library('dompdf_gen');

        // Convert to PDF
        $this->dompdf->load_html($html);
        $this->dompdf->render();
        $this->dompdf->stream('lista_trabalhos_por_categoria.pdf');
    }

    private function complementaDados(array $trabalhos)
    {
        foreach($trabalhos as $trabalho) {
            $trabalho->autores = $this->Autores->getBytrabalho($trabalho->id);
            $trabalho->arquivos = $this->Arquivos->getBytrabalho($trabalho->id);
        }

        return $trabalhos;
    }

    public function download($id, $fileType) {
        $arquivo = $this->Arquivos->getLastByTrabalhoTipo($id, $fileType);

        $tipos = array('doc' => 'doc', 'docx' => 'doc', 'odt' => 'doc', 'pdf' => 'pdf');

        $pathinfo = pathinfo($arquivo->nome_arquivo);
        $dados_arquivos[$tipos[strtolower(substr($pathinfo['extension'], 0, 3))]] = array($arquivo->nome_arquivo, $pathinfo['extension']);

        switch($fileType) {
            case 'doc':
                $path_to_file = FILES_PATH . $dados_arquivos['doc'][0];
                $filename = 'trab' . str_pad($id, 4, '0', STR_PAD_LEFT) . '.' . $dados_arquivos['doc'][1];
                break;
            case 'pdf':
                $path_to_file = FILES_PATH . $dados_arquivos['pdf'][0];
                $filename = 'trab' . str_pad($id, 4, '0', STR_PAD_LEFT) . '.' . $dados_arquivos['pdf'][1];
        }

        $this->load->helper('download');

        $content = file_get_contents($path_to_file);

        force_download($filename, $content);
    }

    public function corrigirarquivos()
    {
        $arquivos = $this->Arquivos->getAll();

        $tipos = array('doc' => 'doc', 'docx' => 'doc', 'odt' => 'doc', 'pdf' => 'pdf');

        foreach($arquivos as $arquivo) {
            $pathinfo = pathinfo($arquivo->nome_arquivo);
            $novo_nome = 'trab' . str_pad($arquivo->id_trabalho, 4, '0', STR_PAD_LEFT) . '.' . $pathinfo['extension'];
            $tipo_arquivo = $tipos[strtolower($pathinfo['extension'])];

            $dados['nome_arquivo'] = $novo_nome;
            $dados['tipo_arquivo'] = $tipo_arquivo;

            if(rename(FILES_PATH . $arquivo->nome_arquivo, FILES_PATH . $novo_nome)) {
                $this->Arquivos->update($arquivo->id, $dados);
            }
        }

        echo 'Concluído.';
    }
}