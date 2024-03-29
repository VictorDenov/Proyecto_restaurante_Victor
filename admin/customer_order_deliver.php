<?php
    require("database_connectivity.php");

    $customer_invoice_id=$_POST['ci_id'];
    $customer_id=$_POST['cus_id'];
    $order_date=$_POST['ci_fecha'];
    $order_no=$_POST['ci_numero_pedido'];

    $order_status="ORDER DELIVERED";

    $sql=$conn->prepare("SELECT * FROM detalles_carrito_producto  WHERE cus_id=? AND pcd_fecha=?");
    $sql->bind_param("is",$customer_id,$order_date);
    $sql->execute();
    $result=$sql->get_result();
    if($result->num_rows > 0 )
    {   
        $sql11=$conn->prepare("SELECT * FROM customer WHERE cus_id = ? ");
        $sql11->bind_param("i",$customer_id);
        $sql11->execute();
        $result11=$sql11->get_result();
        $row11=$result11->fetch_assoc();
        $customer_name = $row11["cus_nombre"];
        $customer_contact = $row11["cus_contacto"];
        
//        $msg="$customer_name (Order No.: $order_no) your order has been delivered successfully.";
//        $data=urlencode($msg);
//        $sms="http://bhashsms.com/api/sendmsg.php?user=innovics&pass=1234567890&sender=INVSIT&phone=$customer_contact&text=$data&priority=ndnd&stype=normal";
        // $content = file_get_contents($sms);
        
        while($row=$result->fetch_assoc())
        {
            $prod_cart_id=$row["pcd_id"];
            $sql1=$conn->prepare("UPDATE detalles_carrito_producto SET pcd_estado=? WHERE pcd_id=? ");
            $sql1->bind_param("si",$order_status,$prod_cart_id);
            $sql1->execute();
        }
        
        $sql1=$conn->prepare("UPDATE factura_cliente SET ci_estado=? WHERE ci_id=? ");
        $sql1->bind_param("si",$order_status,$customer_invoice_id);
        $sql1->execute();
        echo"<script type='text/javascript'>
    alert('Order Delivered!');
   window.location='customer_order_placed.php';
    </script>";
    }
    else
    {
        echo"<script type='text/javascript'>
    alert('Order Not Delivered!');
    window.location='customer_order_placed.php';
    </script>";
    }
?>