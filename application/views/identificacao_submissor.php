
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
                    <form role="form" method="post" action="<?php echo base_url();?>submissao/login/autenticar">
                        <fieldset>
                            <legend>Dados do submissor</legend>
                            <div class="form-group">
                                <label for="email">e-mail:</label>
                                <input type="text" name="email" id="email" class="form-control" data-validation="email"data-validation-error-msg="e-mail inválido" autofocus>
                            </div>
                            <div class="form-group">
                                <label for="senha">Senha:</label>
                                <input type="password" name="senha" id="senha" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Enviar</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-link" href="<?php echo base_url();?>submissao/login/esquecisenha">Esqueci minha senha...</a>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>