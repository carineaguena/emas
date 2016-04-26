                <!-- Modal instituição -->
                <div class="modal fade" id="modalReenvio" tabindex="-1" role="dialog" aria-labelledby="modalReenvio" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">Reenvio de arquivos</h4>
                          </div>
                          <div class="modal-body">
                            <p style="text-align: center; font-size: 13px;">Você deve reenviar ambos os formatos de arquivo (DOC e PDF).</p>
                            <fieldset>
                                <legend>Arquivos</legend>
                                <form method="post" enctype="multipart/form-data" id="form_reenvio">
                                    <input type="hidden" id="id_trabalho" name="id">
                                    <div class="form-group">
                                        <label for="arquivo_doc">Arquivo DOC/DOCX:</label>
                                        <input type="file" id="arquivo_doc" name="arquivo_doc" class="form-control">
                                    </div>
                                     <div class="form-group">
                                        <label for="arquivo_pdf">Arquivo PDF:</label>
                                        <input type="file" id="arquivo_pdf" name="arquivo_pdf" class="form-control">
                                    </div>
                                </form>
                            </fieldset>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-default" onclick="javascript:enviarArquivos()">Enviar</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- fim Modal instituição -->

                 <ol class="breadcrumb">
                  <li class="active">Trabalhos</li>
                </ol>
                <p class="info">Clique sobre os ícones ao lado de cada trabalho para realizar as operações de alteração de dados e reenvio dos arquivos quando necessário.</p>
                <?php
                    if(isset($msg)) {
                        echo '<div class="alert alert-info">' . $msg . '</div>';
                    }

                    if(isset($erro)) {
                        echo '<div class="alert alert-danger">' . $erro . '</div>';
                    }
                ?>
                <table class="table table-striped table-condensed" id="listagem">
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Categoria</th>
                            <th>Área</th>
                            <th>Tipo</th>
                            <th>Modalidade</th>
                            <th>Formato</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            if(isset($trabalhos)) {
                                foreach($trabalhos as $trabalho) {
                                    echo '
                                        <tr>
                                            <td>' . $trabalho->titulo . '</td>
                                            <td>' . $trabalho->categoria . '</td>
                                            <td>' . $trabalho->area . '</td>
                                            <td>' . $trabalho->tipo . '</td>
                                            <td>' . $trabalho->modalidade . '</td>
                                            <td>' . ($trabalho->formato ? $trabalho->formato : 'N/A') . '</td>
                                            <td style="width: 10%; vertical-align: middle;"><a href="' . base_url() . 'submissao/trabalho/alterar/' . $trabalho->id . '" title="Alterar"><i class="glyphicon glyphicon-pencil"></i></a>&nbsp;&nbsp;<a href="javascript:reenviarArquivos(' . $trabalho->id . ')" title="Reenviar arquivos"><i class="glyphicon glyphicon-open"></i></a></td>
                                        </tr>
                                    ';
                                }
                            }

                            if(count($trabalhos) == 0) {
                                echo '
                                    <tr>
                                        <td colspan="7" style="text-align: center;">Nenhum trabalho submetido</td>
                                    </tr>
                                ';
                            }
                        ?>
                    </tbody>
                </table>
                <p style="text-align: center;"><a href="<?php echo base_url(); ?>submissao/trabalho/novo" class="btn btn-primary">Submeter novo trabalho</a></p>
