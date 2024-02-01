<?php 
require("database_connectivity.php");

$cus_id=$_POST["cus_id"];
$sql=$conn->prepare("DELETE FROM cliente WHERE cus_id=?");
$sql->bind_param("i",$cus_id);
if($sql->execute()){
    echo"<script type='text/javascript'>
    alert('¡Registro eliminado con éxito!');
    window.location='customer_view.php';
    </script>";
}
else
{
    echo"<script type='text/javascript'>
    alert('Registro no borrado');
    window.location='customer_view.php';
    </script>";
}
?>