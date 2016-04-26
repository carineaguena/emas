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
                <ol class="breadcrumb">
                    <li><a href="<?php echo base_url() . (!isset($module) ? 'submissao' : $module);?>/trabalho" title="Lista de trabalhos submetidos">Trabalhos</a></li>
                    <li class="active"><?php echo $title; ?></li>
                </ol>
                <p class="info">Preencha corretamente os dados do trabalho nos campos abaixo.<br>Os campos marcados com <span class="required">*</span> são obrigatórios.</p>

                <?php
                    if(isset($erro)) {
                        echo '<div class="alert alert-danger">' . $erro . '</div>';
                    }
                ?>

                <form method="post" action="<?php echo base_url(). (!isset($module) ? 'submissao' : $module);?>/trabalho/gravar" enctype="multipart/form-data" role="form">
                    <fieldset>
                        <legend>Dados do trabalho</legend>
                        <input type="hidden" name="id" value="<?php if(isset($trabalho->id)) { echo $trabalho->id; }?>">
                        <input type="hidden" id="modalidade_tem_formatos" value="<?php if(isset($trabalho->id_modalidade) && !empty($formato)) { echo 'S'; } else { echo 'N';} ?>">
                        <input type="hidden" id="id_modalidade" name ="id_modalidade" value="<?php if(isset($trabalho->id_modalidade)) { echo $trabalho->id_modalidade;} ?>">
                        <input type="hidden" id="id_formato" name ="id_formato" value="<?php if(isset($trabalho->id_formato)) { echo $trabalho->id_formato;} ?>">
                        <input type="hidden" id="numero_autores" name="numero_autores" value="<?php if(isset($autores)) { echo count($autores); } else { echo 3; } ?>">
                        <div class="form-group">
                            <label for="titulo">Título <span class="required">*</span>:</label>
                            <input type="text" id="titulo" name="titulo" class="form-control" value="<?php if(isset($trabalho->titulo)) { echo $trabalho->titulo;} ?>" data-validation="required" data-validation-error-msg="campo obrigatório">
                        </div>
                        <div class="form-group">
                            <label for="titulo">Resumo <span class="required">*</span>:</label>
                            <textarea id="resumo" name="resumo" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório"><?php if(isset($trabalho->resumo)) { echo $trabalho->resumo;} ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="nome_orientador">Nome do orientador:</label>
                            <input type="text" id="nome_orientador" name="nome_orientador" class="form-control" value="<?php if(isset($trabalho->nome_orientador)) { echo $trabalho->nome_orientador;} ?>">
                        </div>
                        <div class="form-group">
                            <label for="email_orientador">e-mail do orientador:</label>
                            <input type="text" id="email_orientador" name="email_orientador" class="form-control" value="<?php if(isset($trabalho->email_orientador)) { echo $trabalho->email_orientador;} ?>" data-validation="email" data-validation-error-msg="e-mail inválido" data-validation-optional="true">
                        </div>
                        <div class="form-group">
                            <label for="nome_coorientador1">Nome do co-orientador 1:</label>
                            <input type="text" id="nome_coorientador1" name="nome_coorientador1" class="form-control" value="<?php if(isset($trabalho->nome_coorientador1)) { echo $trabalho->nome_coorientador1;} ?>">
                        </div>
                        <div class="form-group">
                            <label for="email_coorientador1">e-mail do co-orientador 1:</label>
                            <input type="text" id="email_coorientador1" name="email_coorientador1" class="form-control" value="<?php if(isset($trabalho->email_coorientador1)) { echo $trabalho->email_coorientador1;} ?>" data-validation="email" data-validation-error-msg="e-mail inválido" data-validation-optional="true">
                        </div>
                         <div class="form-group">
                            <label for="nome_coorientador2">Nome do co-orientador 2:</label>
                            <input type="text" id="nome_coorientador2" name="nome_coorientador2" class="form-control" value="<?php if(isset($trabalho->nome_coorientador2)) { echo $trabalho->nome_coorientador2;} ?>">
                        </div>
                        <div class="form-group">
                            <label for="email_coorientador2">e-mail do co-orientador 2:</label>
                            <input type="text" id="email_coorientador2" name="email_coorientador2" class="form-control" value="<?php if(isset($trabalho->email_coorientador2)) { echo $trabalho->email_coorientador2;} ?>" data-validation="email" data-validation-error-msg="e-mail inválido" data-validation-optional="true">
                        </div>
                        <div class="form-group">
                            <label for="id_categoria">Categoria <span class="required">*</span>:</label>
                            <select id="id_categoria" name="id_categoria" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório">
                                <option value="">-- Selecione a categoria --</option>
                                <?php
                                    foreach($categorias as $categoria) {
                                        echo '<option value="' . $categoria->id . '" ';

                                        if(isset($trabalho->id_categoria) && $trabalho->id_categoria == $categoria->id) {
                                            echo 'selected="selected" ';
                                        }

                                        echo '>' . $categoria->descricao . '</option>';
                                    }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="id_area">Área <span class="required">*</span>:</label>
                            <select id="id_area" name="id_area" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório">
                                <?php
                                    if(!isset($trabalho->id_categoria)) {
                                        echo '<option value="">-- Selecione a categoria para carregar as áreas --</option>';
                                    }

                                    if(isset($areas)) {
                                        foreach($areas as $area) {
                                            echo '<option value="' . $area->id . '" ';

                                            if(isset($trabalho->id_area) && $trabalho->id_area == $area->id) {
                                                echo 'selected="selected" ';
                                            }

                                            echo '>' . $area->nome . '</option>';
                                        }
                                    }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="id_tipo">Tipo de trabalho <span class="required">*</span>:</label>
                            <select id="id_tipo" name="id_tipo" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório">
                                <option value="">-- Selecione o tipo de trabalho --</option>
                                <?php
                                    foreach($tipos as $tipo) {
                                        echo '<option value="' . $tipo->id . '" ';

                                        if(isset($trabalho->id_tipo) && $trabalho->id_tipo == $tipo->id) {
                                            echo 'selected="selected" ';
                                        }

                                        echo '>' . $tipo->descricao . '</option>';
                                    }

                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="id_nivel">Nível <span class="required">*</span>:</label>
                            <select id="id_nivel" name="id_nivel" class="form-control" data-validation="required" data-validation-error-msg="campo obrigatório">
                                <option value="">-- Selecione o nível --</option>
                                <?php
                                    foreach($niveis as $nivel) {
                                        echo '<option value="' . $nivel->id . '" ';

                                        if(isset($trabalho->id_nivel) && $trabalho->id_nivel == $nivel->id) {
                                            echo 'selected="selected" ';
                                        }

                                        echo '>' . $nivel->descricao . '</option>';
                                    }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Modalidade:</label>
                            <input type="text" id="modalidade" name="modalidade" class="form-control" readonly="readonly" value="<?php if(isset($trabalho->id_modalidade)) { echo $trabalho->modalidade; }?>">
                        </div>
                        <div class="form-group" id="div_formato" <?php if(!isset($formato) || empty($formato)) { echo 'style="display: none;"'; }?>>
                            <label>Formato:</label>
                            <input type="text" class="form-control" readonly="readonly" id="formato" value="<?php if(isset($formato) && !empty($formato)) {echo $formato;} else {echo '';}?>">
                        </div>
                        <?php

                        if(!isset($trabalho->id)) {

                        ?>

                        <div class="form-group">
                            <label for="arquivo_doc">Arquivo .doc/.docx/.odt<span class="required">*</span>:</label>
                            <input type="file" id="arquivo_doc" name="arquivo_doc">
                        </div>
                        <div class="form-group">
                            <label for="arquivo_pdf">Arquivo .pdf<span class="required">*</span>:</label>
                            <input type="file" id="arquivo_pdf" name="arquivo_pdf">
                        </div>

                        <?php
                        }
                        ?>
                        <hr>
                        <fieldset>
                            <legend>Autores do trabalho</legend>
                            <p class="info">Preencha corretamente os dados dos autores do trabalho <strong>(incluindo o submissor, orientador e co-orientadores - quando aplicável)</strong>.<br>Campos em branco serão desconsiderados.</p>
                            <div id="div_autores">
                            <?php
                                $num_autores = 3;

                                for($a = 1; $a <= $num_autores; $a++) {
                                    echo '
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4">
                                                <div class="container-fluid">
                                                    <div class="form-group">
                                                        <label for="nome_autor' . $a .'">Nome do autor ' . $a . ':</label>
                                                        <input type="text" id="nome_autor' . $a . '" name="nome_autor' . $a . '" class="form-control" value="' . (isset($autores[$a-1] ) ? $autores[$a-1]->nome : '') . '">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4">
                                                <div class="container-fluid">
                                                    <div class="form-group">
                                                        <label for="email_autor' . $a .'">e-mail do autor ' . $a . ':</label>
                                                        <input type="text" id="email_autor' . $a . '" name="email_autor' . $a . '" class="form-control" value="' . (isset($autores[$a-1] ) ? $autores[$a-1]->email : '') . '">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4">
                                                <div class="container-fluid">
                                                    <div class="form-group">
                                                        <label for="instituicao_autor' . $a . '">Instituição do autor ' . $a . ':</label>
                                                        <div class="input-group">
                                                            <select id="instituicao_autor' . $a . '" name="instituicao_autor' . $a . '" class="form-control instituicao_select">
                                                            <option value="">-- Selecione a instituição --</option>';

                            foreach($instituicoes as $instituicao) {
                                echo '<option value="' . $instituicao->id . '"' .
                                (isset($autores[$a-1]) && $autores[$a-1]->id_instituicao == $instituicao->id ? ' selected="selected"' : '') . '>' . $instituicao->nome . '</option>';
                            }

                            echo '                          </select>
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-default" type="button" title="Adicionar nova instituição" onclick="mostraModalInstituicao($(\'#instituicao_autor' . $a . '\'))" tabindex="-1"><i class="glyphicon glyphicon-plus"></i></button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    ';
                                }
                            ?>
                            </div>
                        </fieldset>
                        <hr>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Enviar</button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" onclick="document.location='<?php echo base_url(). (!isset($module) ? 'submissao' : $module);?>/trabalho';">Voltar</button>
                        </div>
                    </fieldset>
                </form>
