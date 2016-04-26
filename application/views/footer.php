        </div><!-- container -->
      <footer style="font-size: 14px; padding-top: 20px; padding-bottom: 15px; background-color: lightgrey;">
        <div class="container maxwidth" style="text-align: center;">
            <p>EMAS - Event Management System</p>
            <p>Instituto Federal de Educação, Ciência e Tecnologia Catarinense - Campus Camboriú</p>
            <p>Desenvolvido por: <a href="https://www.facebook.com/geati.ifc" target="_blank" title="Acessar a página do GEATI no Facebook">GEATI - Grupo de Estudos Avançados em Tecnologia da Informação</a>
        </div>
      </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="<?php echo base_url(); ?>js/jquery.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>js/bootstrap.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>js/offcanvas.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>js/jquery.fancybox.js?v=2.1.5"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>js/jquery.fancybox-buttons.js?v=1.0.5"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>js/jquery.mask.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>js/form-validator/jquery.form-validator.min.js"></script>
    <script type="text/javascript"> var url_base = '<?php echo base_url();?>';</script>
    <?php
        if(isset($scripts)) {
            foreach($scripts as $script) {
                echo '<script type="text/javascript" src="' . base_url() . 'js/'. $script . '.js"></script>';
            }
        }

        if (isset( $additional_script)) {
            echo "<script type=\"text/javascript\">";
            echo $additional_script;
            echo "</script>";
        }
    ?>
  </body>
</html>