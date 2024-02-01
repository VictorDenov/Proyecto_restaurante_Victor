<!DOCTYPE html>
<html>

<?php 
require("1_metatags.php");
?>

<body class="goto-here">

<?php require("2_header.php"); ?>

    <!-- <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <p class="breadcrumbs"><span class="mr-2"><a href="index.php">Home</a></span> <span class="mr-2"><a href="#" style="font-size: 12px;">Orders</a></span></p>
            <h1 class="mb-0 bread">Invoice</h1>
          </div>
        </div>
      </div>
    </div> -->

    <br><br>

<?php  
require("database_connectivity.php");
require("4_customer_session_data.php");
?>

<section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- <div class="callout callout-info">
              <h5><i class="fas fa-info"></i>&ensp;Note:</h5>
              Click the print button at the bottom of the invoice to print.
            </div> -->

            <!-- Main content -->
            <div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">

          <?php
            $customer_id=$_POST['cd_id'];
            $order_date=$_POST['ci_fecha'];
            $order_no=$_POST['ci_order_no'];
                                    
            $sql=$conn->prepare("SELECT * FROM factura_cliente,cliente WHERE factura_cliente.cus_id=?  AND factura_cliente.ci_fecha=? AND factura_cliente.ci_order_no=? AND factura_cliente.cus_id=cliente.cus_id ");
            $sql->bind_param("isi",$customer_id,$order_date,$order_no);
            $sql->execute();
            $result=$sql->get_result();
            $row=$result->fetch_assoc();
            $ci_id=$row["ci_id"];
            $ci_order_no=$row['ci_order_no'];
            $cus_id=$row['cus_id'];
            $cus_name=$row['cus_name'];
            $cus_address=$row['cus_address'];
            $cus_contact=$row['cus_contact'];
            $cus_email=$row['cus_email'];
            $ci_shipping_address=$row['ci_shipping_address'];
            $ci_landmark=$row['ci_landmark'];
            $ci_city=$row['ci_city'];
            $ci_pin=$row['ci_pin'];
            $ci_state=$row['ci_state'];
            $ci_country=$row['ci_country'];
            $ci_status=$row['ci_status'];
            $ci_date=$row['ci_date'];

            $sql2=$conn->prepare("SELECT * FROM branch");
            $sql2->execute();
            $result2=$sql2->get_result();
            $row2=$result2->fetch_assoc();
            $b_id=$row2['b_id'];
            $b_name=$row2['b_name'];
            $b_address=$row2['b_address'];

          ?>

                  <h4>
                    <img src="images/amino/2_bg.png" style="width: 50px;"> &ensp;JDV
                     <small class="float-right">Fecha: <?php //echo date("d-m-Y",strtotime($row["ci_date"]));?></small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <br>
              <!-- info row -->
              <div class="row invoice-info">

                <div class="col-sm-8 invoice-col">
                  <!-- From -->
                  <address>
                    <strong><?php echo $b_name; ?></strong><br>
                    <?php echo $b_address; ?><br>
                    Telefono: +593 0989594950<br>
                    Email: jdv@gmail.com
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                <b>Factura #076-<?php echo $b_id; echo "-"; echo str_pad($ci_id, 4, '0', STR_PAD_LEFT); ?></b><br>
                <b>Fecha: </b><?php echo $ci_date; ?><br>
                <b>N.º de Pedido: </b><?php echo $ci_order_no; ?><br>
                <b>Modo de Pago: </b>


      <?php
        if($row['ci_payment_mode'] == "COD")
          {
        ?>
       <?php echo $row['ci_payment_mode'];?>
        <?php
          }
        else
          {
        ?>
        <?php echo $row['ci_payment_mode'];?>
        <br>
        <b>Transaction ID: </b>
        <?php echo $row['ci_transaction_no'];?>
        <?php
          }
        
      ?>
                  <br>
                </div>
                <!-- /.col -->
              </div>

              <hr><br>

              <div class="row invoice-info">
              <div class="col-sm-8 invoice-col">
                  Billing Details
                  <address>
                    <strong><?php echo $cus_name; ?></strong><br>
                    Address: <?php echo $cus_address; ?><br>
                    Phone: +91 <?php echo $cus_contact; ?><br>
                    Email: <?php echo $cus_email; ?><br>
                  </address>
                  <br>
                  Order Status: <?php echo $ci_status; ?>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                    Detalles del Envío
                    <address>
                        <strong><?php echo $cus_name; ?></strong><br>
                        <?php echo $ci_shipping_address; ?><br>
                        <?php echo $ci_landmark; ?>, 
                        <?php echo $ci_city; ?><br>
                        <?php echo $ci_state; ?>, 
                        <?php echo $ci_country; ?><br> Código Postal: 
                        <?php echo $ci_pin; ?><br>
                        Teléfono: +91 <?php echo $cus_contact; ?><br>
                        Correo Electrónico: <?php echo $cus_email; ?>
                    </address>
                </div>

                <!-- /.col -->
              </div>

              <hr><br>

              <!-- Table row -->
              <div class="row">
                <div class="col-12 table-responsive">
                  <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>N.º</th>
                        <th>Producto</th>
                        <th align="right">Precio</th>
                        <th align="center">Cantidad</th>
                        <th align="right">Total</th>
                    </tr>

                    </thead>

                    <tbody>
              <?php 

                $sql1=$conn->prepare("SELECT * FROM factura_cliente ci,detalles_carrito_producto pcd,detalles_producto pd,detalles_inventario sd WHERE pd.pd_id=sd.pd_id AND pcd.pd_id=pd.pd_id AND pcd.cus_id=? AND ci.ci_numero_pedido=? AND ci.ci_fecha=?");

               $sql1=$conn->prepare("SELECT * FROM detalles_carrito_producto,detalles_inventario WHERE detalles_carrito_producto.cus_id=? AND detalles_carrito_producto.pcd_numero_pedido=? AND detalles_carrito_producto.pcd_fecha=? AND detalles_carrito_producto.pd_id=detalles_inventario.pd_id");
                $sql1->bind_param("iis",$customer_id,$order_no,$order_date);
                $sql1->execute();
                $result1=$sql1->get_result();                               
                $sl=1;
                while($row1=$result1->fetch_assoc())
                {
                // $total+=$row1['pcd_total_amount'];
              ?>

              <tr>
                <td><?php echo $sl++;?></td>
                <td><?php echo $row1['pcd_Nombre'];?></td>
                <td><?php echo $row1['pcd_precio'];?></td>
                <td><?php echo $row1['pcd_cantidad'];?></td>
                <td><?php echo $row1['pcd_monto_total'];?></td>
              </tr>

              <?php
                }
              ?>

                <tr>
                  <td colspan="4" align="right"><b>Subtotal: </b></td>
                  <td><b><?php echo $row['ci_subtotal'];?></b></td>
                </tr>

                    </tbody>
                  </table>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <hr><br>

              <div class="row">
                <!-- accepted payments column -->
                <div class="col-7">
                  <p class="lead">Amino's India</p>
                  <img src="images/amino/19.png" alt="Facebook" style="width: 50px;">&nbsp;
                  <img src="images/amino/18.png" alt="Instagram" style="width: 82px;">&emsp;
                  <img src="images/amino/17.png" alt="Zomato" style="width: 115px;">&nbsp;&emsp;
                  <img src="images/amino/16.png" alt="Swiggy" style="width: 160px;">

                  <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">
                  Nuestro objetivo es proporcionar el máximo de proteínas en una comida con menos calorías posibles con toda la higiene natural, orgánica, libre de gluten alimentos saludables.<br>Su ingesta diaria de proteínas.                  </p>
                </div>
                <!-- /.col -->

                <div class="col-5">
                  <p class="lead"></p>

                  <div>
                    <table class="table" >
                      <tr>
                        <th style="width:1%">Subtotal:</th>
                        <td><?php echo $row['ci_subtotal'];?></td>
                      </tr>
                      <tr>
                        <th>Tax:</th>
                        <td><?php echo $row['ci_tax'];?></td>
                      </tr>
                      <!-- <tr>
                        <th>SGST (<?php echo $row['ci_sgst_percent'];?> %)</th>
                        <td><?php echo $row['ci_sgst'];?></td>
                      </tr> -->
                      <tr>
                        <th>Descuento:</th>
                        <td><?php echo $row['ci_total_discount'];?></td>
                      </tr>
                      <tr>
                        <th>Envío:</th>
                        <td><?php echo $row['ci_delivery_charges'];?></td>
                      </tr>
                      <tr>
                        <th>Total:</th>
                        <td><?php echo $row['ci_grand_total'];?></td>
                      </tr>
                    </table>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- this row will not appear when printing -->
              <div class="row no-print">
                <div class="col-12">
                  <!-- <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Print</a> -->
                  <!-- <button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Submit
                    Payment
                  </button> -->
                  <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
                    <i class="fas fa-download"></i> Generar Factura
                  </button>
                </div>
              </div>
            </div>
            <!-- /.invoice -->
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>


<?php require("4_footer.php"); ?>
<?php require("5_footerscripts.php"); ?>

</body>
</html>