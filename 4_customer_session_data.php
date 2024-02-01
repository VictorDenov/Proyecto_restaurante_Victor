<?php
if(isset($_SESSION['cliente']))
{
$cliente_session=TRUE;
require("database_connectivity.php");
$sql=$conn->prepare("SELECT * FROM cliente WHERE cus_username=?");
$sql->bind_param("s",$_SESSION["cliente"]);
$sql->execute();
$result=$sql->get_result();
$row=$result->fetch_assoc();
$cus_fname=$row["cus_nombre"];
$cus_lname=$row["cus_apellido"];
$cus_name=$cus_fname." ".$cus_lname;
$cus_id=$row["cus_id"];
$cus_contact=$row["cus_contacto"];
$cus_email=$row["cus_correo_electronico"];
$cus_address=$row["cus_direccion"];
$cus_username=$row["cus_username"];
$cus_password_enc=$row["cus_password"];
$cus_password=base64_decode($cus_password_enc);
}
else
{
    $cliente_session=FALSE;
}
?>