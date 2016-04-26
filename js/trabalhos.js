var instituicao_select_destino = null;

function reenviarArquivos(id)
{
    alert('Prazo de submissão encerrado. Não é possível reenviar os arquivos.');
    return false;
    $('#id_trabalho').val(id);
    $('#arquivo_doc').val('');
    $('#arquivo_pdf').val('');
    $('#form_reenvio').attr('action', '');

    $('#modalReenvio').modal({show: true});
}

function enviarArquivos()
{
    $('#modalReenvio').modal({show: false});
    $('#form_reenvio').attr('action', url_base + 'submissao/trabalho/processareenvio');
    document.getElementById('form_reenvio').submit();
}

var processaNivelTipo = function () {
    if($('#id_nivel').val() == '' || $('#id_tipo').val() == '') {
        $('#id_modalidade').val('');
        $('#modalidade').val('');
        $('#modalidade_tem_formatos').val('N');
        $('#id_formato').val('');
        $('#formato').val('');
        $('#div_formato').css('display', 'none');
    }
    else {
        $.ajax({
            url: url_base + 'submissao/formato/getformatos',
            type: 'post', // método de envio dos dados (POST, GET)
            data: {id_nivel: $('#id_nivel').val(), id_tipo: $('#id_tipo').val()},
            dataType: 'json',
            success: function(json) {
                //console.log(json);
                if (json.temFormatos == 'S') {
                    $('#id_formato').val(json.id_formato);
                    $('#formato').val(json.formato);
                    $('#modalidade_tem_formatos').val('S');
                    $('#div_formato').css('display', 'block');
                }
                else {
                    $('#modalidade_tem_formatos').val('N');
                    $('#id_formato').val('');
                    $('#formato').val('');
                    $('#div_formato').css('display', 'none');
                }
                $('#id_modalidade').val(json.modalidade.id);
                $('#modalidade').val(json.modalidade.descricao);
            },
            error: function(xhr, errorMessage) { // função a ser executada em caso de erro na requisição
                alert('Erro no carregamento do formato do trabalho. Tente novamente.');
                console.log(errorMessage);
                console.log(xhr);
            }
        });
    }
}

$(document).ready(function() {
    $.validate({onValidate : function() {
        var retorno = [];

        if ($('#modalidade_tem_formatos').val() == 'S' && $('#id_formato').val() == '') {
            retorno.push({
                element : $('#id_formato'),
                message : 'para o nível selecionado é necessário indicar o formato do trabalho.'
            });
        }

        if($('#arquivo_doc').val() == '') {
            retorno.push({
                element : $('#arquivo_doc'),
                message : 'é necessário anexar o arquivo nos formatos DOC/DOCX/ODT e PDF.'
            });
        }

        if($('#arquivo_pdf').val() == '') {
            retorno.push({
                element : $('#arquivo_pdf'),
                message : 'é necessário anexar o arquivo nos formatos DOC/DOCX/ODT e PDF.'
            });
        }

        autores_preenchidos = 0;

        for(a = 1; a <= $('#numero_autores').val(); a++) {
            if($('#nome_autor' + a).val() != '' && $('#email_autor' + a).val != '') {
                autores_preenchidos++;
            }
        }

        if(autores_preenchidos == 0) {
            retorno.push({
                element : $('#div_autores'),
                message : 'pelo menos um autor deve ser informado (nome e e-mail).'
            });
        }

        if (retorno.length > 0) {
            return retorno;
        }
    }});

    $('#id_categoria').change(function () {
        $.ajax({
            url: url_base + 'submissao/area/getareas',
            type: 'post', // método de envio dos dados (POST, GET)
            data: {id_categoria: $('#id_categoria').val()},
            dataType: 'json',
            success: function(json) {
                //console.log(json);
                $('#id_area').empty();
                var option = $('<option>');
                option.val('');
                option.text('-- Selecione a área --');
                option.appendTo(('#id_area'));
                for(i in json.areas) {
                    option = $('<option>');
                    option.val(json.areas[i].id);
                    option.text(json.areas[i].nome);
                    option.appendTo(('#id_area'));
                }
            },
            error: function(xhr, errorMessage) { // função a ser executada em caso de erro na requisição
                alert('Erro no carregamento das áreas. Tente novamente.');
                console.log(errorMessage);
            }
        });
    });

    $('#id_tipo').on('change', processaNivelTipo); // change(function() {processaNivelTipo();});

    $('#id_nivel').on('change', processaNivelTipo); //change(function() {processaNivelTipo();});
});



    /*$('#btn_adiciona_autores').click(function() {
        num_autores = $('#numero_autores').val();
        num_autores++;
        $('#numero_autores').val(num_autores);

        div_row = $('<div>');
        div_row.addClass('row');

        div_col_nome = $('<div>');
        div_col_nome.addClass('col-lg-4 col-md-4');
        div_col_nome.appendTo(div_row);

        div_container_nome = $('<div>');
        div_container_nome.addClass('container-fluid');
        div_container_nome.appendTo(div_col_nome);

        form_group_nome = $('<div>');
        form_group_nome.addClass('form-group');
        form_group_nome.appendTo(div_container_nome);

        label_nome = $('<label>');
        label_nome.prop('for', 'nome_autor' + num_autores);
        label_nome.text('Nome do autor ' + num_autores + ':');
        label_nome.appendTo(form_group_nome);

        input_nome = $('<input>');
        input_nome.prop('type', 'text');
        input_nome.prop('id', 'nome_autor' + num_autores);
        input_nome.prop('name', 'nome_autor' + num_autores);
        input_nome.addClass('form-control');
        input_nome.appendTo(form_group_nome);

        div_col_email = $('<div>');
        div_col_email.addClass('col-lg-4 col-md-4');
        div_col_email.appendTo(div_row);

        div_container_email = $('<div>');
        div_container_email.addClass('container-fluid');
        div_container_email.appendTo(div_col_email);

        form_group_email = $('<div>');
        form_group_email.addClass('form-group');
        form_group_email.appendTo(div_container_email);

        label_email = $('<label>');
        label_email.prop('for', 'email_autor' + num_autores);
        label_email.text('e-mail do autor ' + num_autores + ':');
        label_email.appendTo(form_group_email);

        input_email = $('<input>');
        input_email.prop('type', 'text');
        input_email.prop('id', 'email_autor' + num_autores);
        input_email.prop('name', 'email_autor' + num_autores);
        input_email.addClass('form-control');
        input_email.appendTo(form_group_email);

        div_col_instituicao = $('<div>');
        div_col_instituicao.addClass('col-lg-4 col-md-4');
        div_col_instituicao.appendTo(div_row);

        div_container_instituicao = $('<div>');
        div_container_instituicao.addClass('container-fluid');
        div_container_instituicao.appendTo(div_col_instituicao);

        form_group_instituicao = $('<div>');
        form_group_instituicao.addClass('form-group');
        form_group_instituicao.appendTo(div_container_instituicao);

        label_instituicao = $('<label>');
        label_instituicao.prop('for', 'instituicao_autor' + num_autores);
        label_instituicao.text('Instituição do autor ' + num_autores + ':');
        label_instituicao.appendTo(form_group_instituicao);

        input_group_instituicao = $('<div>');
        input_group_instituicao.addClass('input-group');
        input_group_instituicao.appendTo(form_group_instituicao);

        select_instituicao = $('#instituicao_autor1').clone();
        select_instituicao.prop('id', 'instituicao_autor' + num_autores);
        select_instituicao.prop('name', 'instituicao_autor' + num_autores);
        select_instituicao.addClass('form-control instituicao_select');
        select_instituicao.appendTo(input_group_instituicao);

        span_add_instituicao = $('<span>');
        span_add_instituicao.addClass('input-group-btn');
        span_add_instituicao.appendTo(input_group_instituicao);

        btn_add_instituicao = $('<button>');
        btn_add_instituicao.addClass('btn btn-default');
        btn_add_instituicao.prop('type', 'button');
        btn_add_instituicao.prop('tabindex', '-1');
        btn_add_instituicao.prop('title', 'Adicionar nova instituição');
        btn_add_instituicao.on('click', function() { mostraModalInstituicao($('#instituicao_autor' + num_autores)); });
        btn_add_instituicao.html('<i class="glyphicon glyphicon-plus"></i>');
        btn_add_instituicao.appendTo(span_add_instituicao);

        div_row.appendTo($('#div_autores'));
    }); */

