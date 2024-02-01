<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="./css2/style.css">
</head>
<?php require("1_metatags.php"); ?>

<body class="goto-here">

  <?php require("2_header.php"); ?>

  <section id="home-section" class="hero">
    <div class="home-slider owl-carousel">
      <div class="slider-item" style="background-image: url(images/caldo.jpg);">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-md-12 ftco-animate text-center">
              <h1 class="mb-2">Emociónate por estar sano </h1>
              <h2 class="subheading mb-4"> Servimos comida fresca </h2>
              <!-- <p><a href="#" class="btn btn-primary">View Details</a></p> -->
            </div>

          </div>
        </div>
      </div>

      <div class="slider-item" style="background-image: url(images/imajen1.jpg);">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-sm-12 ftco-animate text-center">
              <h1 class="mb-2">Un exterior sano empieza por dentro<</h1>
              <h2 class="subheading mb-4">100% fresco &amp; Alimentos ecológicos</h2>
              <!-- <p><a href="#" class="btn btn-primary">View Details</a></p> -->
            </div>

          </div>
        </div>
      </div>
    </div>
  </section>



  <section class="ftco-section">
    <div class="container">
      <div class="row no-gutters ftco-services">
        <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services mb-md-0 mb-4">
            <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-shipped"></span>
            </div>
            <div class="media-body">
              <h3 class="heading">Envío gratuito</h3>
              <span>Para pedidos superiores a 100</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services mb-md-0 mb-4">
            <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-diet"></span>
            </div>
            <div class="media-body">
              <h3 class="heading">Siempre fresco</h3>
              <span>Producto bien envasado</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services mb-md-0 mb-4">
            <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-award"></span>
            </div>
            <div class="media-body">
              <h3 class="heading">Calidad superior</h3>
              <span>Productos de calidad</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services mb-md-0 mb-4">
            <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-customer-service"></span>
            </div>
            <div class="media-body">
              <h3 class="heading">Ayuda</h3>
              <span>24/7 Support</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="ftco-section ftco-category ftco-no-pt">
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <div class="row">
            <div class="col-md-6 order-md-last align-items-stretch d-flex">
              <div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(); width: 100%; height: 341px; padding-top: 330px;">
                <div class="text text-center">
                  <!-- <h2>The Protein House</h2> -->
                  <!-- <p>Your Daily Protein Intake</p> -->
                  <p><a href="shop.php" class="btn btn-primary">Haz tu pedido</a></p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(images/amino/9.jpg);">
                <div class="text px-3 py-1">
                  <!-- <h2 class="mb-0"><a href="#">Fruits</a></h2> -->
                </div>
              </div>
              <div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(images/amino/7.jpg);">
                <div class="text px-3 py-1">
                  <!-- <h2 class="mb-0"><a href="#">Vegetables</a></h2> -->
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(images/amino/imajen1.jpg);">
            <div class="text px-3 py-1">
              <!-- 		<h2 class="mb-0"><a href="#">Juices</a></h2> -->
            </div>
          </div>
          <div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(images/amino/8.jpg);">
            <div class="text px-3 py-1">
              <!-- <h2 class="mb-0"><a href="#">Dried</a></h2> -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <?php require("3_newsletter.php"); ?>
  <?php require("4_footer.php"); ?>
  <?php require("5_footerscripts.php"); ?>

  <script>
    var modal = document.getElementById("myModal");

    var img = document.getElementById("myImg");
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");
    img.onclick = function() {
      modal.style.display = "block";
      modalImg.src = this.src;
      captionText.innerHTML = this.alt;
    }

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }
  </script>

</body>

</html>