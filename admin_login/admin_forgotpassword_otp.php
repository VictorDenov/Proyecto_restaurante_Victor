<?php session_start();?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>JDV</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../admin/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="../admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="../admin/dist/css/adminlte.min.css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="..index.php"><b>JDV</b><br></a>
  </div>
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Estás a sólo un paso de tu nueva contraseña, restablece tu contraseña ahora.</p>

      <form action="admin_forgotpassword_otp_check.php" method="post" autocomplete="off" onsubmit="return ValidateForm()">
        <div class="input-group mb-3">
          <input type="text" name="otp" placeholder="OTP" class="form-control" id="otp">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-key"></span>
              <span id="otp_error"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="new_password" placeholder="New Password" class="form-control" id="new_password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
              <span id="new_password_error"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="confirm_password" placeholder="Confirm Password" class="form-control" id="confirm_password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
              <span id="confirm_password_error"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button type="submit" href="admin_forgotpassword_otp_check.php" class="btn btn-primary btn-block">Cambiar contraseña</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <p class="mt-3 mb-1">
        <a href="index.php">Login</a>
      </p>
    </div>
  </div>
</div>
<script src="../admin/plugins/jquery/jquery.min.js"></script>
<script src="../admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../admin/dist/js/adminlte.min.js"></script>

<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%'
    });
  });
</script>

<script type="text/javascript">
function ValidateForm()
{
var otp = '';
var new_password = '';
var confirm_password = '';

otp = fieldrequired('otp', 'otp_error', 'OTP');
new_password = pasword('new_password', 'new_password_error', 'New Password');
confirm_password = pasword('confirm_password', 'confirm_password_error', 'Confirm Password');

if ( otp == 0 && new_password == 0 && confirm_password == 0) 
{
    return true;
}
else
{
    return false;
}
}
</script>

</body>
</html>
