
            <div class="row" style="margin-top: 17px;">
                <div class="col-lg-6 col-md-6">

                        <img src="<?php echo base_url();?>imagens/entrada.jpg" class="thumbnail img-rounded" style="width: 100%; margin-top: 20px;">

                </div>
                <div class="col-lg-6 col-md-6">
                    <p class="info">Forneça seus dados abaixo para a autenticação de acesso ao sistema.</p>

                    <?php
                        if (isset($erro)) {
                            echo '<div class="alert alert-danger">' . $erro . '</div>';
                        }
                    ?>
                    <?php
                        if (isset($msg)) {
                            echo '<div class="alert alert-info">' . $msg . '</div>';
                        }
                    ?>
                    <form role="form" method="post" action="<?php echo base_url();?>admin/login/autenticar">
                        <fieldset>
                            <legend>Dados do usuário</legend>
                            <div class="form-group">
                                <label for="login">login:</label>
                                <input type="text" name="login" id="login" class="form-control" data-validation="required"data-validation-error-msg="campo obrigatório" autofocus>
                            </div>
                            <div class="form-group">
                                <label for="senha">Senha:</label>
                                <input type="password" name="senha" id="senha" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Enviar</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-link" href="<?php echo base_url();?>admin/login/esquecisenha">Esqueci minha senha...</a>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>