<?php 
require('database_connectivity.php');
session_start();
require("4_customer_session_data.php");//CONTIENE LOS DATOS DE LA SESIÓN DEL USUARIO
$pcd_id=$_REQUEST['pcd_id'];
$cart_status="CART";
$sql1=$conn->prepare("DELETE FROM detalles_carrito_producto WHERE cus_id=? AND pcd_id=? AND pcd_estado=?");
$sql1->bind_param("iis",$cus_id,$pcd_id,$cart_status);
if($sql1->execute()){
echo "<script type='text/javascript'>
alert('Producto eliminado de la cesta');        
window.history.back();
</script>";    
}else
{
echo "<script type='text/javascript'>
alert('Producto no eliminado');        
window.history.back();
</script>";        
}
?>