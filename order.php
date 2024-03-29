<!DOCTYPE html>
<html>

<?php require("1_metatags.php"); ?>

<body class="goto-here">

  <?php require("2_header.php"); ?>

  <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
    <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
        <div class="col-md-9 ftco-animate text-center">
          <p class="breadcrumbs"><span class="mr-2"><a href="index.php">Inicio</a></span> <span class="mr-2"><a href="#" style="font-size: 12px;">Ordenes</a></span></p>
          <h1 class="mb-0 bread">Mis Ordenes</h1>
        </div>
      </div>
    </div>
  </div>

  <?php
  require("database_connectivity.php");
  require("4_customer_session_data.php");
  ?>

  <section class="ftco-section ftco-cart">
    <div class="container">
      <div class="row">
        <div class="col-md-12 ftco-animate">
          <div class="cart-list">
            <table class="table">

              <thead class="thead-primary">
                <tr class="text-center">
                  <th>Nombre</th>
                  <th>Número de Pedido</th>
                  <th>Precio</th>
                  <th>Modo de Pago</th>
                  <th>Fecha</th>
                  <th>Estado</th>
                  <th>&nbsp;</th>
                </tr>

              </thead>



              <?php
              $sql = $conn->prepare("SELECT * FROM factura_cliente ci,cliente c WHERE ci.cus_id=c.cus_id AND ci.cus_id=?");
              $sql->bind_param("i", $cus_id);
              $sql->execute();
              $result = $sql->get_result();
              while ($row = $result->fetch_assoc()) {
              ?>
                <tbody>
                  <tr class="text-center">

                    <td style="width: 20%; font-size: 16px;"><?php echo $row['cus_Nombre']; ?></td>

                    <td style="width: 15%; font-size: 16px;"><?php echo $row['ci_numero_pedido']; ?></td>

                    <td style="width: 15%; font-size: 16px;">&#8377; <?php echo $row['ci_total_general']; ?></td>

                    <td style="width: 15%; font-size: 16px;">
                      <?php if ($row['ci_modo_pago'] == "COD") {    ?>
                        <b><?php echo $row['ci_modo_pago']; ?></b>
                      <?php } else { ?>
                        <b><?php echo $row['ci_modo_pago']; ?></b><br>
                        <?php echo $row['ci_numero_transaccion']; ?>
                      <?php } ?>
                    </td>

                    <td style="width: 15%; font-size: 16px;"><?php echo $row['ci_fecha']; ?></td>

                    <td style="width: 15%; font-size: 16px;">
                      <p><?php echo $row['ci_estado']; ?></p>
                    </td>

                    <!-- <td><a href="customer_order_summary_products.php?ci_order_no=<?php echo base64_encode($row['ci_numero_pedido']); ?>" class="btn btn-primary py-2 px-5">Bill</a></td> -->

                    <td>
                      <form action="bill.php" method="post">
                        <input type="hidden" name="cd_id" id="cd_id" value="<?php echo $row['cus_id']; ?>">
                        <input type="hidden" name="ci_date" id="ci_date" value="<?php echo $row['ci_fecha']; ?>">
                        <input type="hidden" name="ci_order_no" id="ci_order_no" value="<?php echo $row['ci_numero_pedido']; ?>">
                        <button type="submit"><a class="btn btn-primary py-2 px-5">Efectivo</a></button>
                      </form>
                    </td>

                    <!-- <td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
                    
                    <td class="image-prod"><div class="img" style="background-image:url(images/product-1.jpg);"></div></td>
                    
                    <td class="product-name">
                      <h3>Bell Pepper</h3>
                      <p>Far far away, behind the word mountains, far from the countries</p>
                    </td>
                    
                    <td class="price">$4.90</td>
                    
                    <td class="quantity">
                      <div class="input-group mb-3">
                        <input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
                      </div>
                    </td>
                    
                    <td class="total">$4.90</td> -->

                  </tr>
                </tbody>
              <?php
              }
              ?>


            </table>
          </div>
        </div>
      </div>
    </div>
  </section>

  <?php require("3_newsletter.php"); ?>
  <?php require("4_footer.php"); ?>
  <?php require("5_footerscripts.php"); ?>

</body>

</html>