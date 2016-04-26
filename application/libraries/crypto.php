<?php

class Crypto
{
    public function encode($txt)
    {
        $aux = md5('emas' . $txt . 'camboriuifc');

        return substr($aux, 5, 5) . substr($aux, 0, 5) . substr($aux, 10, 5);
    }

    public function match($txt, $chave)
    {
        $chave_aux = $this->encode($txt);

        return ($chave_aux == $chave);
    }
}