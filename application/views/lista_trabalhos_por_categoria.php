<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Lista de trabalhos submetidos por categoria - Versão para impressão</title>
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
        <p style="text-align: center; font-size: 18px; font-weight: bold;">Lista de trabalhos submetidos por categoria</p>
        <table style="width: 100%;" id="listagem">
            <thead>
                <tr>
                    <th>Cód.</th>
                    <th>Título</th>
                    <th>Nível</th>
                    <th>Modalidade</th>
                    <th>Submissor</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    if(isset($trabalhos)) {
                        $categoria = '';
                        foreach($trabalhos as $trabalho) {
                            if($categoria != $trabalho->categoria . ' => ' . $trabalho->nivel .
                                ' => ' . $trabalho->tipo . ( $trabalho->formato ? ' => ' .
                                $trabalho->formato : '') . ' => ' . $trabalho->area) {

                                $categoria = $trabalho->categoria . ' => ' . $trabalho->nivel .
                                ' => ' . $trabalho->tipo . ( $trabalho->formato ? ' => ' .
                                $trabalho->formato : '') . ' => ' . $trabalho->area;

                                echo '
                                    <tr>
                                        <td colspan="5" style="font-weight: bold; text-align: center;"><big>' . $categoria . '</big></td>
                                    </tr>
                                ';
                            }

                            echo '
                                <tr>
                                    <td>' . $trabalho->id . '</td>
                                    <td>' . $trabalho->titulo . '</td>
                                    <td>' . $trabalho->nivel . '</td>
                                    <td>' . $trabalho->modalidade . '</td>
                                    <td>' . $trabalho->submissor . ' (' . $trabalho->email_submissor .')</td>
                                </tr>
                            ';
                        }
                    }

                    if(count($trabalhos) == 0) {
                        echo '
                            <tr>
                                <td colspan="5" style="text-align: center;">Nenhum trabalho submetido</td>
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