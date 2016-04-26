            <p class="info">Digite a nova senha de acesso abaixo.</p>

            <form role="form" method="post" action="<?php echo base_url() . (!isset($module) ? 'submissao' : $module); ?>/login/atualizarsenha">
                <input type="hidden" name="id" value="<?php echo $id; ?>">
                <input type="hidden" name="chave" value="<?php echo $chave; ?>">
                <fieldset>
                    <legend>Nova senha:</legend>
                    <div class="form-group">
                        <label for="senha">Senha:</label>
                        <input type="password" name="senha" id="senha" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório" autofocus>
                    </div>
                    <div class="form-group">
                        <label for="confirma_senha">Confirmação da senha:</label>
                        <input type="password" name="confirma_senha" id="confirma_senha" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório" autofocus>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </div>
                </fieldset>
            </form>