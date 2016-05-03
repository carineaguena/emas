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
    <link rel="stylesheet" type="tex/css" href="<?php echo base_url(); ?>css/jquery.dataTables.css">
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
          <a class="navbar-brand" href="<?php echo base_url(); ?>avaliacao">EMAS - Avaliação de trabalhos - <?php echo $event->nome;?></a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" title="<?php echo $user->nome_usuario;?>"><i class="glyphicon glyphicon-user"> </i> <?php echo $user->login_usuario;?> <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="<?php echo base_url() . (!isset($module) ? 'avaliacao/avaliador' : ($module == 'admin' ? 'usuario/alterar' : 'avaliador/alterar')); ?>/alterar">Meus dados</a></li>
                    <li><a href="<?php echo base_url() . (!isset($module) ? 'avaliacao' : $module); ?>/login/alterarsenha">Alterar senha</a></li>
                    <li><a href="<?php echo base_url() . (!isset($module) ? 'avaliacao' : $module); ?>/login/sair">Sair</a></li>
                  </ul>
              </li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->
    <div id="corpo" class="container maxwidth">