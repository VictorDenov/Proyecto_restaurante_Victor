<?php 
session_start();
require('database_connectivity.php');
require('4_customer_session_data.php');

$order_no="";
$characters = array_merge(range('0','9'));
for ($i = 0; $i < 6; $i++) {
    $rand = mt_rand(0, count($characters)-1);
    $order_no .= $characters[$rand];
}

$delivery_charges=$_POST["ci_cargos_entrega"];
$sub_total=$_POST['ci_subtotal'];
$cgst_percent=$_POST['ci_cgst_percent'];
$cgst=$_POST['ci_cgst'];
$sgst_percent=$_POST['ci_sgst_percent'];
$sgst=$_POST['ci_sgst'];
$payment_mode=$_POST["ci_modo_pago"];
$shipping_address=$_POST["ci_street"];
$landmark=$_POST["ci_area"];
$contact_no=$_POST["cus_contacto"];
$date=date('Y-m-d');
$total_price=$_POST['ci_total_general'];
if($payment_mode=="COD")
{
    $transaction_no=0;
}else
{    
    $transaction_no=$_POST["ci_transaction_no"];
}
$status="ORDER PENDING";

$message = "$fullname Su PEDIDO NO :$order_no Se Ha Realizado Con Éxito,Confirmaremos Su Pedido Pronto";
$data=urlencode($message);
// $sms_url="http://bhashsms.com/api/sendmsg.php?user=innovics&pass=1234567890&sender=INVSIT&phone=$contact&text=$data&priority=ndnd&stype=normal";
    
$sql=$conn->prepare("INSERT INTO factura_cliente(cus_id,b_id,ci_numero_pedido,ci_direccion_envio,ci_punto_referencia,ci_ciudad,ci_codigo_postal,ci_estados,ci_pais,ci_cargos_entrega,ci_contacto_no,ci_fecha,ci_modo_pago,ci_numero_transaccion,ci_subtotal,ci_impuesto,ci_descuento_total,ci_total_general	ci_estado)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
$sql->bind_param("iisssiissssddddd",$cd_id,$order_no,$shipping_address,$landmark,$delivery_charges,$total_price,$contact_no,$date,$payment_mode,$transaction_no,$status,$cgst_percent,$cgst,$sgst_percent,$sgst,$sub_total);
$sql->execute();

$pcd_cart="CART";
$prod_cart_status="PEDIDO REALIZADO";
$sql1=$conn->prepare("UPDATE detalles_carrito_producto SET pcd_numero_pedido=?,pcd_estado=? WHERE cus_id=? AND pcd_estado=?");
$sql1->bind_param("isis",$order_no,$prod_cart_status,$cd_id,$pcd_cart);
if($sql1->execute())
{

    echo"<script type='text/javascript'>
    alert('PEDIDO REALIZADO CON ÉXITO');
    window.location='index.php';
    </script>";
}else{
    echo"<script type='text/javascript'>
    alert('¡¡¡PEDIDO NO REALIZADO!!!');
    window.history.back();
    </script>";
}

?>
