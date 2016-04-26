            <p class="info">Informe seu e-mail abaixo e um link será enviado, através do qual você poderá cadastrar uma nova senha.</p>

            <?php
                if (isset($erro)) {
                    echo '<div class="alert alert-danger">' . $erro . '</div>';
                }
            ?>

            <form role="form" method="post" action="<?php echo base_url() . (!isset($module) ? 'submissao' : $module); ?>/login/processaresquecisenha">
                <fieldset>
                    <legend>Dados do usuário</legend>
                    <div class="form-group">
                        <label for="login">e-mail:</label>
                        <input type="text" name="email" id="email" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório" autofocus>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </div>
                </fieldset>
            </form>