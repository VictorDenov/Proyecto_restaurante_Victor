<?php
require('database_connectivity.php');
require("function.php");
//$pc_id=$_POST["pc_id"];
$pc_name=$_POST["pc_name"];
$pc_date=$_POST["pc_date"];

$pc_image=$_FILES["pc_image"]["name"];
$tmp_pc_image=$_FILES["pc_image"]["tmp_name"];
$folder="photos/";
$pc_image=upload_image($pc_image,$tmp_pc_image,$folder);

$sql=$conn->prepare("INSERT INTO categoria_producto(pc_nombre,pc_imagen,pc_fecha) VALUES (?,?,?)");
$sql->bind_param("sss",$pc_name,$pc_image,$pc_date);
if($sql->execute())
{
 echo"<script type='text/javascript'>
 alert('¡Insertado con éxito!');
 window.location='product_category_view.php';
 </script>";
}
 else
 {
  echo"<script type='text/javascript'>
 alert('¡No insertado!');
 window.location='product_category_view.php';
 </script>";      
 }
?>
