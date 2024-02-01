<!DOCTYPE html>
<html>

<?php require("1_metatags.php"); ?>

<body class="goto-here">

<?php require("2_header.php"); ?>

  <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <p class="breadcrumbs"><span class="mr-2"><a href="index.php">Inicio</a></span> <span class="mr-2"><a href="#" style="font-size: 12px;">Registrarse</a></span></p>
            <h1 class="mb-0 bread">Registrarse</h1>
          </div>
        </div>
      </div>
    </div>

    <br>

<section style="background-image: url('images/bg_3edit.jpg'); height: 100%;">

<br><br><br>

<form class="container" style="width: 500px; position: absolute; right: 0%;" action="./admin/customer_insert.php" method="post" enctype="multipart/form-data" onsubmit="return ValidateRegisterForm()">

<!--           <span class="login100-form-title">
            Register
          </span> -->

          <div class="wrap-input100 validate-input" data-validate = "First Name is required">
            <input class="input100" type="text" name="cus_nombre"" id="cus_nombre"" placeholder="Primer Nombre" minlength="3" maxlength="15" required>
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fas fa-user-circle" aria-hidden="true"></i>
              <span id="cus_fname_error"></span>
            </span>
          </div>

          <div class="wrap-input100 validate-input" data-validate = "Last Name is required">
            <input class="input100" type="alphabets" name="cus_apellido" id="cus_apellido"" placeholder="Apellido" minlength="1" maxlength="15" required>
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fas fa-user-circle" aria-hidden="true"></i>
              <span id="cus_lname_error"></span>
            </span>
          </div>

            <div class="wrap-input100 validate-input" data-validate = "Contact is required">
            <input class="input100" type="number" name="cus_contacto" id="cus_contacto" placeholder="Contact" pattern="[6-9]{1}[0-9]{9}" minlength="10" maxlength="10" required>
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fas fa-phone-alt" aria-hidden="true"></i>
              <span id="cus_contact_error"></span>
            </span>
          </div>

          <div class="wrap-input100 validate-input" data-validate = "Email is required">
            <input class="input100" type="text" name="cus_correo_electronico" id="cus_correo_electronico" placeholder="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Enter valid email" required>
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fas fa-envelope" aria-hidden="true"></i>
              <span id="cus_email_error"></span>
            </span>
          </div> 

           <div class="wrap-input100 validate-input" data-validate = "Address is required">
            <input class="input100" type="text" name="cus_direccion" id="cus_direccion" placeholder="Address" minlength="10" required>
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fas fa-address-book" aria-hidden="true"></i>
              <span id="cus_direccion"></span>
            </span>
          </div> 

           <div class="wrap-input100 validate-input" data-validate = "Username is required">
            <input class="input100" type="text" name="cus_username" id="cus_username" placeholder="Username" minlength="6" maxlength="15" pattern="[A-Za-z0-9_]{1,15}" title="Only letters (either case), numbers, and the underscore; no more than 15 characters" required>
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fas fa-user" aria-hidden="true"></i>
              <span id="cus_username_error"></span>
            </span>
          </div>

          <div class="wrap-input100 validate-input" data-validate = "Password is required">
            <input class="input100" type="password" name="cus_password" id="cus_password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters" minlength="6" maxlength="15" required>
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fa fa-lock" aria-hidden="true"></i>
              <span id="cus_password_error"></span>
            </span>
          </div>
          
          <div class="container-login100-form-btn">
            <button class="login100-form-btn" type="submit">
              Sign Up
            </button>
          </div>

          <!-- <div class="text-center p-t-20">
            <span class="txt1">
              Already have an account?
            </span>
            <a class="txt2" href="index.php">
              Login
              <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
            </a>
          </div> -->
        </form>
        <br>
      </section>

<?php require("3_newsletter.php"); ?>
<?php require("4_footer.php"); ?>
<?php require("5_footerscripts.php"); ?>

<script type="text/javascript">
<?php
require("database_connectivity.php");

$cus_nombre = $_POST["cus_nombre"];
$cus_apellido = $_POST["cus_apellido"];
$cus_nombre_usuario = $_POST["cus_nombre_usuario"];
$cus_contacto = $_POST["cus_contacto"];
$cus_correo_electronico = $_POST["cus_correo_electronico"];
$cus_direccion = $_POST["cus_direccion"];
$cus_username = $_POST["cus_username"];
$cus_password = $_POST["cus_password"];

$sql = $conn->prepare("CALL RegisterNewCustomer(?, ?, ?, ?, ?, ?, ?, ?, @p_is_valid)");
$sql->bind_param("sssbssss", $cus_nombre, $cus_apellido, $cus_nombre_usuario, $cus_contacto, $cus_correo_electronico, $cus_direccion, $cus_username, $cus_password);
$sql->execute();

// Obtén el resultado del procedimiento almacenado
$result = $conn->query("SELECT @p_is_valid AS p_is_valid");
$row = $result->fetch_assoc();
$is_valid = $row["p_is_valid"];

if ($is_valid == 1) {
    echo "success";
} else {
    echo "failed";
}

$conn->close();
?>

</script>

</body>
</html>