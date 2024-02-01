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
            <h1>Stock Details</h1>
          </div>

        </div>
      </div><!-- /.container-fluid -->
    </section>

<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-12">

          <div class="card">
            <div class="card-header">
              <div class="text-right">
              <button class="btn btn-default" onclick="window.location.href='stock_form.php'; "><i class="fas fa-plus"></i>&ensp;<th>New Record</th></button>
            </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>Nombre del Producto</th>
                  <th>Imagen</th>
                  <th>Precio Unitario</th>
                  <th>Cantidad en Stock</th>
                  <th>Descuento</th>
                  <th>Precio con Descuento</th>
                  <th>Precio de Venta</th>
                  <th>Disponibilidad</th>
                  <th>Fecha</th>
                  <th>Editar</th>
                  <th>Eliminar</th>
              </tr>

                </thead>
                <tbody>

<?php
  require("database_connectivity.php");
  $sql=$conn->prepare("SELECT * FROM detalles_inventario,detalles_producto WHERE detalles_inventario.pd_id=detalles_producto.pd_id ");
  $sql->execute();
  $result=$sql->get_result();
  $sno=1;
  while($row=$result->fetch_assoc())
    {
?>
  <tr>
    <td><?php echo $sno++;?></td>
    <td><?php echo $row["pd_nombre"];?></td>
    <td><img src="photos/<?php echo $row["pd_imagen1"];?>" alt="" height="100" width="100"></td>
    <td><?php echo $row["sd_precio_unitario"]; ?> </td>  
    <td><?php echo $row["sd_cantidad"];?></td>    
    <td><?php echo $row["sd_descuento"];?></td>
    <td><?php echo $row["sd_precio_descuento"];?></td>
    <td><?php echo $row["sd_precio_venta"];?></td>
    <td><?php echo $row["sd_estado"];?></td>
    <td><?php echo $row["pd_fecha"];?></td>

    <td>
      <form method="post" action="stock_edit_form.php" enctype="multipart/form-data">
            <input type="hidden" name="sd_id" id="sd_id" value="<?php echo $row["sd_id"];?>">
            <input type="submit" value="Edit" class="btn btn-block bg-gradient-primary btn-sm">
      </form>
    </td>   

    <td>
      <form method="post" action="stock_delete.php" enctype="multipart/form-data">
            <input type="hidden" name="sd_id" id="sd_id" value="<?php echo $row["sd_id"];?>">
            <input type="submit" value="Delete" class="btn btn-block bg-gradient-danger btn-sm">  
      </form>   
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

