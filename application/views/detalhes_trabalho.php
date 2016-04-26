                <ol class="breadcrumb">
                    <li><a href="<?php echo base_url() . (!isset($module) ? 'submissao' : $module);?>/trabalho" title="Lista de trabalhos submetidos">Trabalhos</a></li>
                    <li class="active"><?php echo $title; ?></li>
                </ol>

                    <fieldset>
                        <legend>Dados do trabalho</legend>

                        <div class="form-group">
                            <label for="titulo">Título:</label>
                            <div class="form-control" style="height: auto;" readonly>
                            <?php echo $trabalho->titulo; ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="titulo">Resumo:</label>
                            <!--<textarea id="resumo" name="resumo" class="form-control" readonly>-->
                            <div class="form-control" style="height: auto;" readonly>
                                <?php if(isset($trabalho->resumo)) { echo $trabalho->resumo;} ?>
                            </div>
                            <!--</textarea>-->
                        </div>
                        <div class="form-group">
                            <label for="nome_orientador">Nome do orientador:</label>
                            <input type="text" id="nome_orientador" name="nome_orientador" class="form-control" value="<?php if(isset($trabalho->nome_orientador)) { echo $trabalho->nome_orientador;} ?>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="email_orientador">e-mail do orientador:</label>
                            <input type="text" id="email_orientador" name="email_orientador" class="form-control" value="<?php if(isset($trabalho->email_orientador)) { echo $trabalho->email_orientador;} ?>"readonly>
                        </div>
                        <div class="form-group">
                            <label for="nome_coorientador1">Nome do co-orientador 1:</label>
                            <input type="text" id="nome_coorientador1" name="nome_coorientador1" class="form-control" value="<?php if(isset($trabalho->nome_coorientador1)) { echo $trabalho->nome_coorientador1;} ?>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="email_coorientador1">e-mail do co-orientador 1:</label>
                            <input type="text" id="email_coorientador1" name="email_coorientador1" class="form-control" value="<?php if(isset($trabalho->email_coorientador1)) { echo $trabalho->email_coorientador1;} ?>" readonly>
                        </div>
                         <div class="form-group">
                            <label for="nome_coorientador2">Nome do co-orientador 2:</label>
                            <input type="text" id="nome_coorientador2" name="nome_coorientador2" class="form-control" value="<?php if(isset($trabalho->nome_coorientador2)) { echo $trabalho->nome_coorientador2;} ?>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="email_coorientador2">e-mail do co-orientador 2:</label>
                            <input type="text" id="email_coorientador2" name="email_coorientador2" class="form-control" value="<?php if(isset($trabalho->email_coorientador2)) { echo $trabalho->email_coorientador2;} ?>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="categoria">Categoria:</label>
                            <input type="text" id="categoria" name="categoria" class="form-control" value="<?php if(isset($trabalho->categoria)) { echo $trabalho->categoria;} ?>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="area">Área:</label>
                            <input type="text" id="area" name="area" class="form-control" value="<?php if(isset($trabalho->area)) { echo $trabalho->area;} ?>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="tipo">Tipo de trabalho:</label>
                            <input type="text" id="tipo" name="tipo" class="form-control" value="<?php if(isset($trabalho->tipo)) { echo $trabalho->tipo;} ?>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="nivel">Nível <span class="required">*</span>:</label>
                            <input type="text" id="nivel" name="nivel" class="form-control" value="<?php if(isset($trabalho->nivel)) { echo $trabalho->nivel;} ?>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Modalidade:</label>
                            <input type="text" id="modalidade" name="modalidade" class="form-control" readonly="readonly" value="<?php if(isset($trabalho->id_modalidade)) { echo $trabalho->modalidade; }?>" readonly>
                        </div>
                        <div class="form-group" id="div_formato" <?php if(!isset($formato) || empty($formato)) { echo 'style="display: none;"'; }?>>
                            <label>Formato:</label>
                            <input type="text" class="form-control" readonly="readonly" id="formato" value="<?php if(isset($formato) && !empty($formato)) {echo $formato;} else {echo '';}?>" readonly>
                        </div>

                        <hr>
                        <fieldset>
                            <legend>Autores do trabalho</legend>
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
                                                        <input type="text" id="nome_autor' . $a . '" name="nome_autor' . $a . '" class="form-control" value="' . (isset($autores[$a-1] ) ? $autores[$a-1]->nome : '') . '" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4">
                                                <div class="container-fluid">
                                                    <div class="form-group">
                                                        <label for="email_autor' . $a .'">e-mail do autor ' . $a . ':</label>
                                                        <input type="text" id="email_autor' . $a . '" name="email_autor' . $a . '" class="form-control" value="' . (isset($autores[$a-1] ) ? $autores[$a-1]->email : '') . '" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4">
                                                <div class="container-fluid">
                                                <div class="form-group">
                                                <label for="instituicao_autor' . $a .'">Instituição do autor ' . $a . ':</label>
                                                    <input type="text" id="instituicao_autor' . $a . '" name="instituicao_autor' . $a . '" class="form-control" value="' . (isset($autores[$a-1] ) ? $autores[$a-1]->nome_instituicao : '') . '" readonly>
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
                            <button type="button" class="btn btn-default" onclick="window.history.back();">Voltar</button>
                        </div>
                    </fieldset>

