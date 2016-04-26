<?php

function mysql_to_date( $date ) {
    if ( !$date || $date == '0000-00-00' ) {
        return '';
    }
    else {
        return implode( '/', array_reverse( explode( '-', $date ) ) ); // $partes[2] . '/' . $partes[1] . '/' . $partes[0];
    }
}

function date_to_mysql( $date ) {
    if ( !$date ) {
        return 'NULL';
    }
    else {
        return implode( '-', array_reverse( explode( '/', $date ) ) ); //$delimiters . $partes[2] . '-' . $partes[1] . '-' . $partes[0] . $delimiters;
    }
}

?>
