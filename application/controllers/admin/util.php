<?php

class Util extends CI_Controller
{
    public function backup()
    {
        $backupfile = FCPATH . 'backups/Autobackup_' . date("Ymd") . '.sql';
        $backupzip = $backupfile . '.tar.gz';

        ob_start();
        $backup = system("mysqldump -h localhost -u emas -pemascamboriuifc2015 --lock-tables emas > $backupfile");
        $tar = system("tar -czvf $backupzip $backupfile");
        ob_end_clean();

        if($backup === false) {
            echo 'Erro ao executar o mysqldump';
        }
        else {
            if($tar === false) {
                echo 'Erro ao executar o tar';
            }
            else {
                $message = 'Backup automático do sistema de ' . date('Y-m-d');
                $subject = 'Backup automático do sistema de ' . date('Y-m-d');

                $this->mailer->enviarEmail('sergiohenrique@ifc-camboriu.edu.br', $subject, $message, array($backupzip));

                echo 'Enviado<br><br>';
            }
        }
    }

    public function phpinfo()
    {
        phpinfo();
    }
}