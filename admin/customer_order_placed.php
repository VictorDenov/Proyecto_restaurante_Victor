<!DOCTYPE html>
<html>

<?php require("1_metatags_table.php"); ?>

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

<?php require("2_header.php"); ?>
<?php require("3_sidebar.php"); ?>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Order Details</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">

          <div class="card">
            <!-- <div class="card-header">
              <div class="text-right">
              <button class="btn btn-default" onclick="window.location.href='emp_form.php'; "><i class="fas fa-plus"></i>&ensp;<th>New Record</th></button>
            </div>
            </div> -->
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>N.º</th>
                  <th>Nombre del Cliente</th>
                  <!-- <th>Sucursal</th> -->
                  <th>Fecha del Pedido</th>
                  <th>N.º de Pedido<br>Monto<br>Modo de Pago</th>
                  <th>Estado del Pedido</th>
                  <th>Acción</th>
              </tr>

                </thead>
                <tbody>

<?php
  require("database_connectivity.php");
           $sql=$conn->prepare("SELECT * FROM factura_cliente,cliente WHERE factura_cliente.cus_id=cliente.cus_id ORDER BY factura_cliente.ci_id DESC");
           $sql->execute();
           $result=$sql->get_result();
           $sno=1;
           while($row=$result->fetch_assoc())
    {
?>
  <tr>
    <td><?php echo $sno++;?> </td>
    <td><?php echo $row['cus_nombre']?></td>
    <td><?php echo $row['ci_fecha'];?></td>

    <td>
      <b>Order No.: </b>
      <?php echo $row['ci_numero_pedido'];?>
      <br>
      <b>Amount: </b>
      <?php echo $row['ci_descuento_total'];?>
      <br>
      <b>Payment Mode: </b>
      <?php
        if($row['ci_modo_pago'] == "COD")
          {
        ?>
       <?php echo $row['ci_modo_pago'];?>
        <?php
          }
        else
          {
        ?>
        <?php echo $row['ci_modo_pago'];?>
        <br>
        <b>Transaction ID: </b>
        <?php echo $row['ci_numero_transaccion'];?>
        <?php
          }
        ?>
      </td>

      <td>
        <?php if($row['ci_estado'] == 'ORDER PENDING')
          {
        ?>
        <button class="btn btn-block bg-gradient-warning btn-sm" style="width:100%;">PendiENTE</button>
        <br><br>
        <form action="customer_order_confirm.php" method="post">
          <input type="hidden" name="ci_id" value="<?php echo $row['ci_id']?>">
            <input type="hidden" name="cus_id" value="<?php echo $row['cus_id']?>">
            <input type="hidden" name="ci_date" value="<?php echo $row['ci_fecha']?>">
            <input type="hidden" name="ci_order_no" value="<?php echo $row['ci_numero_pedido']?>">
            <input type="hidden" name="ci_grand_total" value="<?php echo $row['ci_descuento_total']?>">
            
              <button type="submit" class="btn btn-block bg-gradient-success btn-sm" style="width:100%;">Confirmar</button>
        </form>
        <?php
          }
        ?>
        <?php if($row['ci_status'] == 'ORDER CONFIRMED')
          {
        ?>
        <button class="btn btn-block bg-gradient-success btn-sm" style="width:100%;">Confirmado</button>
        <br><br>
        <form action="customer_order_deliver.php" method="post">
            <input type="hidden" name="ci_id" value="<?php echo $row['ci_id']?>">
            <input type="hidden" name="cus_id" value="<?php echo $row['cus_id']?>">
            <input type="hidden" name="ci_date" value="<?php echo $row['ci_fecha']?>">
            <input type="hidden" name="ci_order_no" value="<?php echo $row['ci_numero_pedido']?>">
               <button type="submit" class="btn btn-block bg-gradient-warning btn-sm" style="width:100%;">Delivered</button>
        </form>
        <?php
          }
        ?>
        <?php if($row['ci_status'] == 'ORDER DELIVERED')
          {
        ?>
        <button class="btn btn-block bg-gradient-success btn-sm" style="width:100%;">Delivered</button> <br><br>
        <?php
          }
        ?>
        <?php if($row['ci_status'] == 'ORDER CANCELLED')
          {
        ?>
        <button class="btn btn-block bg-gradient-danger btn-sm" style="width:100%;">Cancelled</button> <br><br>
        <?php
          }
        ?>
      </td>

      <td>
        <br>
            <form action="customer_order_details.php" method="post">
                    <input type="hidden" name="cus_id" value="<?php echo $row['cus_id']?>">
                    <input type="hidden" name="ci_date" value="<?php echo $row['ci_fecha']?>">
                    <input type="hidden" name="ci_order_no" value="<?php echo $row['ci_numero_pedido']?>">
                    <button type="submit" class="btn btn-block bg-gradient-primary btn-sm" style="width:100%;">Detalles de Orden</button> 
            </form>
            <br>
            <!-- <form action="customer_bill_generate.php" method="post">
                    <input type="hidden" name="cus_id" value="<?php echo $row['cus_id']?>">
                    <input type="hidden" name="ci_date" value="<?php echo $row['ci_date']?>">
                    <input type="hidden" name="ci_order_no" value="<?php echo $row['ci_order_no']?>">
                    <button type="submit" class="btn btn-block bg-gradient-primary btn-sm" style="width:100%;">Generate Bill</button>
            </form> -->
      </td>

    </tr> 
    
<?php
  }
?>
</tbody>
</table>
</div>
</div>
</div>
</div>
</section>
</div>

<?php require("4_footer_name.php"); ?>
<?php require("5_footerscripts_table.php"); ?>
    
</body>
</html>