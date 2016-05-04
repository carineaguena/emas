
<h2>Bem-vindo!</h2>
<p>Você já é um avaliador da VII FICE - Feira de Iniciação Científica e Extensão.</p>
<p>Acompanhe os colaborares cadastrados na lista abaixo, agradecemos sua participação.</p>

<div class="modal-content"> 
    <table class="table table-striped table-condensed" id="listagem">

                    <thead>
                        <tr>
                            <th >Nome</th>
                            <th>E-mail</th>
                            <th>Titulação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            if(isset($avaliadores)) {
                                foreach($avaliadores as $avaliadores) {
                                    echo '
                                        <tr>
                                            <td>' . $avaliadores->nome . '</td>
                                            <td>' . $avaliadores->email . '</td>
                                            <td>' . $avaliadores->titulacao . '</td>

                                           
                                        </tr>
                                    ';
                                }
                            }

                            if(count($avaliadores) == 0) {
                                echo '
                                    <tr>
                                        <td colspan="7" style="text-align: center;">Nenhum avaliador cadastrado</td>
                                    </tr>
                                ';
                            }
                        ?>
                    </tbody>
                </table>
</div>

<div class="modal-footer">
<form role="form" method="post" action="<?php echo base_url();?>avaliacao/login/sair">
    <button type="submit" class="btn btn-primary">Sair</button>
</form> 
 </div>
