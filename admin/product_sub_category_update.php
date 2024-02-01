<?php
require('database_connectivity.php');
$psc_id=$_POST["psc_id"];
$psc_name=$_POST["psc_name"];
$psc_date=$_POST["psc_date"];

$sql=$conn->prepare("UPDATE subcategoria_producto SET psc_nombre=?,psc_fecha=? WHERE psc_id=?");
$sql->bind_param("ssi",$psc_name,$psc_date,$psc_id);
if($sql->execute())
{
 echo"<script type='text/javascript'>
 alert('Successfully Updated!');
  window.location='product_sub_category_view.php';
 </script>";
}
 else
 {
  echo"<script type='text/javascript'>
 alert('Not Inserted!');
  window.location='product_sub_category_view.php';
 </script>";      
 }
?>
