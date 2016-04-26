                <p class="info">Preencha seu e-mail no campo abaixo. O sistema enviará para seu e-mail uma mensagem contendo um link personalizado para você proceder com o restante do cadastro como submissor de trabalhos. Verifique a pasta de spam da sua caixa de e-mails, caso não receba a mensagem.</p>
                <?php
                if (isset($erro)) {
                ?>
                <div class="alert alert-danger" role="alert"><?php echo $erro;?></div>
                <?php
                }
                ?>
                <form role="form" method="post" id="form">
                    <fieldset>
                        <legend>Dados do submissor</legend>
                        <div class="form-group">
                            <label for="email">e-mail</label>
                            <input type="text" id="email" name="email" class="form-control" placeholder="e-mail">
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-primary" onclick="validaForm()">Enviar</button>
                        </div>
                    </fieldset>
                </form>