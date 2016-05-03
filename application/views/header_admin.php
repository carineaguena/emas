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
          <a class="navbar-brand" href="<?php echo base_url(); ?>admin">EMAS - Área Administrativa - <?php echo $event->sigla;?></a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li <?php echo ( $link_nav == 'home' ) ? ' class="active"' : ''; ?>><a href="<?php echo base_url(); ?>admin">Home</a></li>
            <li <?php echo ( $link_nav == 'listagens' ) ? ' class="dropdown active"' : ' class="dropdown"'; ?>><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Listagens <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<?php echo base_url(); ?>admin/trabalho">Trabalhos submetidos - Geral</a></li>
                <li><a href="<?php echo base_url(); ?>admin/trabalho/listaporarea">Trabalhos submetidos - Por área (PDF)</a></li>
                <li><a href="<?php echo base_url(); ?>admin/trabalho/listapormodalidade">Trabalhos submetidos - Por modalidade (PDF)</a></li>
                <li><a href="<?php echo base_url(); ?>admin/trabalho/listaporcategoria">Trabalhos submetidos - Por categoria (PDF)</a></li>
              </ul>
            </li>
            <li <?php echo ( $link_nav == 'avaliacao' ) ? ' class="dropdown active"' : ' class="dropdown"'; ?>><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Avaliação <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<?php echo base_url(); ?>admin/avaliador">Avaliadores</a></li>
                <li><a href="<?php echo base_url(); ?>admin/avaliacao/distribuir">Distribuir trabalhos</a></li>
                <li><a href="<?php echo base_url(); ?>admin/avaliacao/distribuidos">Trabalhos distribuídos</a></li>
                <li><a href="<?php echo base_url(); ?>admin/avaliacao/aceitos">Trabalhos aceitos</a></li>
                <li><a href="<?php echo base_url(); ?>admin/avaliacao/rejeitados">Trabalhos rejeitados</a></li>
              </ul>
            </li>
            <li <?php echo ( $link_nav == 'sistema' ) ? ' class="dropdown active"' : ' class="dropdown"'; ?>><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Sistema <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<?php echo base_url(); ?>admin/usuario">Usuários</a></li>
              </ul>
            </li>
      
          <li <?php echo ( $link_nav == 'emissao_certificados' ) ? ' class="dropdown active"' : ' class="dropdown"'; ?>><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Emissão de Certificados <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<?php echo base_url(); ?>admin/emitir_certificado">Emitir Certificado</a></li>
              </ul>
            </li>
          <ul class="nav navbar-nav navbar-right">
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" title="<?php echo $user->nome_usuario;?>"><i class="glyphicon glyphicon-user"> </i> <?php echo $user->login_usuario;?> <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="<?php echo base_url() . (!isset($module) ? 'submissao/submissor' : ($module == 'admin' ? 'usuario/alterar' : 'avaliador/alterar')); ?>/alterar">Meus dados</a></li>
                    <li><a href="<?php echo base_url() . (!isset($module) ? 'submissao' : $module); ?>/login/alterarsenha">Alterar senha</a></li>
                    <li><a href="<?php echo base_url() . (!isset($module) ? 'submissao' : $module); ?>/login/sair">Sair</a></li>
                  </ul>
              </li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->
    <div id="corpo" class="container maxwidth">