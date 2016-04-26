<?php

class ExportCSV {
    private $fileName;
    private $headers;
    private $lines;

    public function __construct( ) {
        $this->lines = array();
        $this->headers = array();
    }

    public function setFileName( $filename ) {
        $this->fileName = $filename;
    }

    public function setHeaders( $headers = array() ) {
        $this->headers = $headers;
    }

    private function getLineHeaders() {
        $txt = "";

        foreach( $this->headers as $key => $header ) {
            if ( $txt ) {
                $txt .= ";";
            }

            $txt .= "\"" . $header . "\"";
        }

        reset( $this->headers );

        return $txt;
    }

    public function addLine( $line = array() ) {
        $this->lines[] = $line;
    }

    public function setDataset( array $dataset ) {
        $this->lines = $dataset;
    }

    public function saveToFile() {
        $file = @fopen( $fileName, "w+" );

        if ( $file ) {
            fwrite( $file, $this->getLineHeaders() . "\n" );

            reset( $this->lines );

            foreach( $this->lines as $key => $line ) {
                $txt = "";

                if (!is_array($line)) {
                    $line = (array) $line;
                }

                foreach( $line as $key => $data ) {
                    if ( $txt ) {
                        $txt .= ";";
                    }

                    $txt .= "\"" . $data . "\"";
                }

                fwrite( $file, $txt . "\n" );
            }

            fclose();

            return true;
        }
        else {
            return false;
        }
    }

    public function putContents() {
        $outText = $this->getLineHeaders() . "\n";

        reset( $this->lines );

        foreach( $this->lines as $key => $line ) {
            $txt = "";

            if (!is_array($line)) {
                $line = (array) $line;
            }

            foreach( $line as $key => $data ) {
                if ( $txt ) {
                    $txt .= ";";
                }

                $txt .= "\"" . $data . "\"";
            }

            $outText .= $txt . "\n";
        }

        header("Content-Type: text/csv");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header("Content-Disposition: attachment; filename={$this->fileName}");

        echo $outText;
        die();
    }
}

?>