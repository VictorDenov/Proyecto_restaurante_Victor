<?php
    require('database_connectivity.php');
    //$sd_id=$_POST["sd_id"];
    $pd_id=$_POST["pd_id"];
    $sd_qty=$_POST["sd_qty"];
    $sd_unit_price=$_POST["sd_unit_price"];
    $sd_discount=$_POST["sd_discount"];
    $sd_discount_price=$_POST["sd_discount_price"];
    $sd_sale_price=$_POST["sd_sale_price"];
    $sd_status=$_POST["sd_status"];
    $sd_date=$_POST["sd_date"];


    $sql=$conn->prepare("INSERT INTO detalles_inventario(pd_id,sd_precio_unitario,sd_cantidad,sd_descuento,sd_precio_descuento,sd_precio_venta,sd_estado,sd_fecha)VALUES(?,?,?,?,?,?,?,?)");
    $sql->bind_param("ididddss",$pd_id,$sd_unit_price,$sd_qty,$sd_discount,$sd_discount_price,$sd_sale_price,$sd_status,$sd_date);

    if($sql->execute())
    {
     echo"<script type='text/javascript'>
     alert('Successfully Inserted!');
	 window.location='stock_view.php';
     </script>";
    }
     else
     {
      echo"<script type='text/javascript'>
     alert('Not Inserted!');
	 window.location='stock_form.php';
     </script>";   
     }
?>