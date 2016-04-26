                <ol class="breadcrumb">
                  <li class="active">Trabalhos</li>
                </ol>
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
                            <th>Cód.</th>
                            <th>Título</th>
                            <th>Categoria</th>
                            <th>Área</th>
                            <th>Tipo</th>
                            <th>Modalidade</th>
                            <th>Formato</th>
                            <th>Submissor</th>
                            <th style="text-align: center;">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            if(isset($trabalhos)) {
                                foreach($trabalhos as $trabalho) {
                                    echo '
                                        <tr>
                                            <td>' . $trabalho->id . '</td>
                                            <td>' . $trabalho->titulo . '</td>
                                            <td>' . $trabalho->categoria . '</td>
                                            <td>' . $trabalho->area . '</td>
                                            <td>' . $trabalho->tipo . '</td>
                                            <td>' . $trabalho->modalidade . '</td>
                                            <td>' . ($trabalho->formato ? $trabalho->formato : 'N/A') . '</td>
                                            <td>' . $trabalho->submissor . ' (' . $trabalho->email_submissor .')</td>
                                            <td style="width: 10%; vertical-align: middle; text-align: center;"><a href="' . base_url() . 'admin/trabalho/detalhes/' . $trabalho->id . '" title="Detalhes"><i class="fa fa-list fa-lg"></i></a>&nbsp;&nbsp;<a href="' . base_url() . 'admin/trabalho/alterar/' . $trabalho->id . '" title="Alterar"><i class="fa fa-pencil fa-lg"></i></a>&nbsp;&nbsp;<a href="' . base_url() . 'admin/trabalho/download/' . $trabalho->id . '/doc" title="Baixar arquivo DOC/DOCX"><i class="fa fa-file-word-o fa-lg"></i></a>&nbsp;&nbsp;<a href="' . base_url() . 'admin/trabalho/download/' . $trabalho->id . '/pdf" title="Baixar arquivo PDF"><i class="fa fa-file-pdf-o fa-lg"></i></a></td>
                                        </tr>
                                    ';
                                }
                            }

                            if(count($trabalhos) == 0) {
                                echo '
                                    <tr>
                                        <td colspan="9" style="text-align: center;">Nenhum trabalho submetido</td>
                                    </tr>
                                ';
                            }
                        ?>
                    </tbody>
                </table>
                <p style="margin-top: 35px;"><button class="btn btn-primary" type="button" onclick="document.location='<?php echo base_url();?>admin/trabalho/generateCSV';">Salvar em formato CSV</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-primary" href="<?php echo base_url();?>admin/trabalho/generatePDF" target="_blank">Salvar em formato PDF</a>
