<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Website da Federação Catarinense de Tiro Prático - FCTP">
    <meta name="author" content="Reginaldo Rubens da Silva">
    <title>EMAS - <?php echo $title; ?></title>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>css/bootstrap.min.css" rel=
    "stylesheet">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>css/site.css" rel=
    "stylesheet">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>css/offcanvas.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>css/jquery.fancybox.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>css/jquery.fancybox-buttons.css" />
  <style type="text/css" id="holderjs-style"></style>
  </head>

  <body>
    <?php if( isset( $modal ) ) { echo $modal; } ?>
    <div class="navbar navbar-fixed-top navbar-inverse" role="navigation" >
      <div class="container maxwidth" >
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Menu</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">EMAS - <?php echo !isset($module_title) ? 'Submissão de trabalhos' : $module_title;?> - <?php echo $event->nome;?></a>
        </div>
        <div class="collapse navbar-collapse">
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->
    <div id="corpo" class="container maxwidth">