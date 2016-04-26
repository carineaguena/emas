function mostraModalInstituicao(elem)
{
    instituicao_select_destino = elem;

    $('#nome_instituicao').val('');
    $('#modalInstituicao').modal({show: true});
}

function adicionaInstituicao()
{
    $.ajax({
        url: url_base + 'submissao/instituicao/adicionar',
        type: 'post', // método de envio dos dados (POST, GET)
        data: {nome_instituicao: $('#nome_instituicao').val()},
        dataType: 'json',
        success: function(json) {
            if(json.inserido == 'S') {
                $('.instituicao_select').each(function(i) {
                    val_antigo = $(this).val();
                    $(this).empty();
                    $(this).html(json.options);
                    $(this).val(val_antigo);
                });
                $(instituicao_select_destino).val(json.id_novo);

                alert('Instituição inserida com sucesso.');
            }
            else {
                alert('Não foi possível inserir. A instituição informada já se encontra cadastrada.');
            }
            $('#modalInstituicao').modal('hide');
        },
        error: function(xhr, errorMessage) { // função a ser executada em caso de erro na requisição
            alert('Erro na gravação da instituição. Tente novamente.');
            console.log(xhr);
        }
    });
}