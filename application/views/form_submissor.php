                <!-- Modal instituição -->
                <div class="modal fade" id="modalInstituicao" tabindex="-1" role="dialog" aria-labelledby="modalInstituicao" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Nova instituição</h4>
                          </div>
                          <div class="modal-body">
                            <p style="text-align: center; font-size: 13px;">Certifique-se de que a instituição que deseja não está realmente na lista antes de cadastrar uma nova.</p>
                            <fieldset>
                                <legend>Dados da nova instituição</legend>
                                <form method="post">
                                    <div class="form-group">
                                        <label for="nome_instituicao">Nome:</label>
                                        <input type="text" id="nome_instituicao" name="nome_instituicao" class="form-control">
                                    </div>
                                </form>
                            </fieldset>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-default" onclick="javascript:adicionaInstituicao()">Gravar</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- fim Modal instituição -->
                    <!-- Modal municipio -->
                <div class="modal fade" id="modalMunicipio" tabindex="-1" role="dialog" aria-labelledby="modalMunicipio" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Novo município</h4>
                          </div>
                          <div class="modal-body">
                            <p style="text-align: center; font-size: 13px;">Certifique-se de que o município que deseja não está realmente na lista antes de cadastrar um novo.</p>
                            <fieldset>
                                <legend>Dados do novo município</legend>
                                <form method="post">
                                    <div class="form-group">
                                        <label for="nome_municipio">Nome:</label>
                                        <input type="text" id="nome_municipio" name="nome_municipio" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="uf_municipio">Uf:</label>
                                        <input type="text" id="uf_municipio" name="uf_municipio" class="form-control">
                                    </div>
                                </form>
                            </fieldset>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-default" onclick="javascript:adicionaMunicipio()">Gravar</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- fim Modal instituição -->
                <p class="info">Preencha corretamente os campos abaixo.<br>Os campos marcados com <span class="required">*</span> são obrigatórios.</p>
                <form role="form" method="post" action="<?php echo base_url();?>submissao/submissor/gravar">
                    <fieldset>
                        <legend>Dados do submissor</legend>
                        <input type="hidden" name="id" value="<?php if(isset($submissor->id)) echo $submissor->id; ?>">
                        <input type="hidden" name="chave" value="<?php echo $chave;?>">
                        <div class="form-group">
                            <label for="">e-mail:</label>
                            <input type="text" id="email" name="email" class="form-control" value="<?php if(isset($submissor->email)) {echo $submissor->email;} else {echo $email;} ?>" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="nome">Nome <span class="required">*</span>:</label>
                            <input type="text" id="nome" name="nome" class="form-control" autofocus value="<?php if(isset($submissor->nome)) echo $submissor->nome; ?>" data-validation="required" data-validation-error-msg="campo obrigatório">
                        </div>
                        <div class="form-group">
                            <label for="id_instituicao">Instituição <span class="required">*</span>:</label>
                            <div class="input-group">
                                <select id="id_instituicao" name="id_instituicao" class="form-control instituicao_select" data-validation="required" data-validation-error-msg="campo obrigatório">
                                    <option value="">-- Selecione uma instituição --</option>
                                    <?php
                                    foreach($instituicoes as $instituicao) {
                                        echo '<option value="' . $instituicao->id . '"> ';

                                        if(isset($submissor->id_instituicao) && $submissor->id_instituicao == $instituicao->id) {
                                            echo 'selected="selected" ';
                                        }

                                        echo $instituicao->nome . '</option>';
                                    }
                                    ?>
                                </select>
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" title="Adicionar nova instituição" onclick="mostraModalInstituicao('#id_instituicao')" tabindex="-1"><i class="glyphicon glyphicon-plus"></i></button>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="id_municipio">Município <span class="required">*</span>:</label>
                            <div class="input-group">
                                <select id="id_municipio" name="id_municipio" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório">
                                    <option value="">-- Selecione um município --</option>
                                    <?php
                                    foreach($municipios as $municipio) {
                                        echo '<option value="' . $municipio->id . '"> ';

                                        if(isset($submissor->id_municipio) && $submissor->id_municipio == $municipio->id) {
                                            echo 'selected="selected" ';
                                        }

                                        echo $municipio->nome . ' - ' . $municipio->uf . '</option>';
                                    }
                                    ?>
                                </select>
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button" title="Adicionar novo município" onclick="mostraModalMunicipio('#id_municipio')" tabindex="-1"><i class="glyphicon glyphicon-plus"></i></button>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha <span class="required">*</span>:</label>
                            <input type="password" id="senha" name="senha" class="form-control" data-validation="required" data-validation-error-msg="você deve cadastrar uma senha para poder acessar o sistema posteriormente">
                        </div>
                        <div class="form-group">
                            <label for="confirma_senha">Confirmação da senha <span class="required">*</span>:</label>
                            <input type="password" id="confirma_senha" name="confirma_senha" class="form-control">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Gravar</button>
                        </div>
                    </fieldset>
                </form>
