<?php 
require("database_connectivity.php");

$ad_id=$_POST["ad_id"];
$sql=$conn->prepare("DELETE FROM admin WHERE ad_id=?");
$sql->bind_param("i",$ad_id);
if($sql->execute()){
    echo"<script type='text/javascript'>
    alert('¡Registro eliminado con éxito!');
    window.location='admin_view.php';
    </script>";
}
else
{
    echo"<script type='text/javascript'>
    alert('Registro no borrado');
    window.location='admin_view.php';
    </script>";
}
?>