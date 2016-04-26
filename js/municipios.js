function mostraModalMunicipio(elem)
{
    municipio_select_destino = elem;

    $('#nome_municipio').val('');
    $('#uf_municipio').val('');
    $('#modalMunicipio').modal({show: true});
}

function adicionaMunicipio()
{
    $.ajax({
        url: url_base + 'submissao/municipio/adicionar',
        type: 'post', // método de envio dos dados (POST, GET)
        data: {nome_municipio: $('#nome_municipio').val(),
            uf_municipio: $('#uf_municipio').val()},
        dataType: 'json',
        success: function(json) {
            if(json.inserido == 'S') {
                $(municipio_select_destino).empty();
                $(municipio_select_destino).html(json.options);
                $(municipio_select_destino).val(json.id_novo);

                alert('Município inserido com sucesso.');
            }
            else {
                alert('Não foi possível inserir. O município informado já se encontra cadastrado.');
            }
            $('#modalMunicipio').modal('hide');
        },
        error: function(xhr, errorMessage) { // função a ser executada em caso de erro na requisição
            alert('Erro na gravação do município. Tente novamente.');
            console.log(xhr);
        }
    });
}