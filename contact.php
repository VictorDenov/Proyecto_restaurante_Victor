<!DOCTYPE html>
<html>

<?php require("1_metatags.php"); ?>

<body class="goto-here">

  <?php require("2_header.php"); ?>

  <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
    <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
        <div class="col-md-9 ftco-animate text-center">
          <p class="breadcrumbs"><span class="mr-2"><a href="index.php">Inicio</a></span> <span class="mr-2"><a href="#" style="font-size: 12px;">Contactos</a></span></p>
          <h1 class="mb-0 bread">Contact us</h1>
        </div>
      </div>
    </div>
  </div>

  <section class="ftco-section contact-section bg-light">
    <div class="row d-flex mb-5 contact-info">
      <!-- Dirección 1 -->
      <div class="col-md-3 d-flex">
        <div class="info bg-white p-4">
          <p><span>Dirección:</span> Marvel Artiza Mall, PB Road, Hubli, Karnataka - 580021</p>
        </div>
      </div>

      <!-- Dirección 2 -->
      <div class="col-md-3 d-flex">
        <div class="info bg-white p-4">
          <p><span>Dirección:</span> PB Road, Opp. Modern Hall, Dharwad, Karnataka - 580004</p>
        </div>
      </div>

      <!-- Teléfono -->
      <div class="col-md-3 d-flex">
        <div class="info bg-white p-4">
          <p><span>Teléfono:</span> <a href="mob://8073667159">+91 80736 67159</a></p>
        </div>
      </div>

      <!-- Correo Electrónico -->
      <div class="col-md-3 d-flex">
        <div class="info bg-white p-4">
          <p><span>Correo Electrónico:</span> <a href="mailto:aminosindia@gmail.com">jdv@gmail.com</a></p>
        </div>
      </div>
    </div>

    <div class="row block-9">
      <!-- Formulario de Contacto -->
      <form id="contact-form" method="post" action="contact1.php" class="bg-white p-5 contact-form">
        <!-- Nombre -->
        <div class="form-group">
          <input name="name" type="text" class="form-control" placeholder="Tu Nombre" required>
        </div>

        <!-- Correo Electrónico -->
        <div class="form-group">
          <input name="email" type="text" class="form-control" placeholder="Tu Correo Electrónico" required>
        </div>

        <!-- Asunto -->
        <div class="form-group">
          <input name="subject" type="text" class="form-control" placeholder="Asunto" required>
        </div>

        <!-- Mensaje -->
        <div class="form-group">
          <textarea name="message" id="" cols="30" rows="7" class="form-control" placeholder="Mensaje" required></textarea>
        </div>

        <!-- Botón de Envío -->
        <div class="form-group">
          <input type="submit" value="Enviar Mensaje" class="btn btn-primary py-3 px-5">
        </div>
      </form>

      <!-- Mapa (suponiendo que es un contenedor de mapa) -->
      <div class="col-md-6 d-flex">
        <div id="map" class="bg-white"></div>
      </div>
    </div>

    </div>
  </section>

  <?php require("4_footer.php"); ?>
  <?php require("5_footerscripts.php"); ?>

</body>

</html>