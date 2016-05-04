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