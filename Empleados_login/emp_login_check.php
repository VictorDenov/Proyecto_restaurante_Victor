<?php
session_start();
require("../database_connectivity.php");
    
    $e_username=$_POST["e_username"];
    $e_password=$_POST["e_password"];

    $sql=$conn->prepare("SELECT * FROM empleado where e_nombre_usuario=?");
    $sql->bind_param("s",$e_username);
    $sql->execute();
    $result=$sql->get_result();
    if($result->num_rows > 0)
    {
        $row=$result->fetch_assoc();
        if($e_password == "12345")
        {
            $_SESSION["e_nombre_usuario"]=$e_username;
            header("Location:../employee/");
        }
        else
        {
            echo "<script>
alert('INVALID USERNAME AND PASSWORD');
    window.location='index.php';
</script>";
        }
    }
    else
    {
        echo "<script>
alert('INVALID USERNAME AND PASSWORD');
    window.location='index.php';
</script>";
    }
?>


