            <p class="info">Digite a nova senha de acesso abaixo.</p>

            <?php
                if(isset($erro)) {
                    echo '
                        <div class="alert alert-danger">' . $erro . '</div>
                    ';
                }
            ?>

            <form role="form" method="post" action="<?php echo base_url();?>admin/login/gravarnovasenha">
                <fieldset>
                    <legend>Nova senha:</legend>
                    <div class="form-group">
                        <label for="senha">Senha:</label>
                        <input type="password" name="senha" id="senha" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório" autofocus>
                    </div>
                    <div class="form-group">
                        <label for="confirma_senha">Confirmação da senha:</label>
                        <input type="password" name="confirma_senha" id="confirma_senha" class="form-control" data-validation="matchfield" data-match="senha" data-validation-error-msg="A confirmação não confere com a senha" autofocus>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </div>
                </fieldset>
            </form>