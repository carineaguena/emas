<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Lista de trabalhos submetidos por modalidade - Versão para impressão</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <style>
            body {
                font-family: arial, helvetica, sans-serif;
                font-size: 11px;
            }
            td, th {
                border-top: 1px solid black;
                border-bottom: 1px solid black;
            }
            table {
                border-collapse: collapse;
            }
        </style>
    </head>
    <body>
        <div style="width: 19cm;">
        <p style="text-align: center; font-size: 18px; font-weight: bold;">Lista de trabalhos submetidos por modalidade</p>
        <table style="width: 100%;" id="listagem">
            <thead>
                <tr>
                    <th>Cód.</th>
                    <th>Título</th>
                    <th>Categoria</th>
                    <th>Área</th>
                    <th>Tipo</th>
                    <th>Submissor</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    if(isset($trabalhos)) {
                        $modalidade = '';
                        foreach($trabalhos as $trabalho) {
                            if($modalidade != $trabalho->modalidade . ' - ' . $trabalho->formato) {
                                $modalidade = $trabalho->modalidade . ' - ' . $trabalho->formato;

                                echo '
                                    <tr>
                                        <td colspan="6" style="font-weight: bold; text-align: center;"><big>' . $modalidade . '</big></td>
                                    </tr>
                                ';
                            }

                            echo '
                                <tr>
                                    <td>' . $trabalho->id . '</td>
                                    <td>' . $trabalho->titulo . '</td>
                                    <td>' . $trabalho->categoria . '</td>
                                    <td>' . $trabalho->area . '</td>
                                    <td>' . $trabalho->tipo . '</td>
                                    <td>' . $trabalho->submissor . ' (' . $trabalho->email_submissor .')</td>
                                </tr>
                            ';
                        }
                    }

                    if(count($trabalhos) == 0) {
                        echo '
                            <tr>
                                <td colspan="6" style="text-align: center;">Nenhum trabalho submetido</td>
                            </tr>
                        ';
                    }
                ?>
            </tbody>
        </table>
        <p style="margin: 25px; font-weight: bold;"><?php echo count($trabalhos); ?> trabalhos listados</p>
        </div>
    </body>
</html>