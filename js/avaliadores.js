var municipio_select_destino = null;

$.validate( {onValidate : function() {
    var retorno = [];

    if ($('#senha').val() != $('#confirma_senha').val()) {
        retorno.push({
            element : $('#senha'),
            message : 'a senha e a confirmação de senha devem ser iguais.'
        });
    }

    if (retorno.length > 0) {
        return retorno;
    }
}});

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
