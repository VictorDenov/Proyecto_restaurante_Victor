   <?php require('4_customer_session_data.php'); ?>
   <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
   	<div class="container">
   		<a class="navbar-brand" href="index.php">JDV</a>
   		<tr>
   			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
   				<span class="oi oi-menu"></span> Menu
   			</button>

   			<div class="collapse navbar-collapse" id="ftco-nav">
   				<ul class="navbar-nav ml-auto">
   					<li class="nav-item"><a href="index.php" class="nav-link">Inicio</a></li>
   					<li class="nav-item"><a href="about.php" class="nav-link">Ayuda</a></li>
   					<li class="nav-item"><a href="shop.php" class="nav-link">Menu</a></li>
   					<li class="nav-item"><a href="contact.php" class="nav-link">Contactos</a></li>


   					<?php
						$total_amount = 0;
						$cart_qty = 0;
						if ($cliente_session == TRUE) {
							$prod_cart_status = "CART";
							$sqlc = $conn->prepare("SELECT * FROM detalles_carrito_producto,cliente WHERE detalles_carrito_producto.cus_id=cliente.cus_id AND cliente.cus_id=? AND detalles_carrito_producto.pcd_estado	=?");
							$sqlc->bind_param("is", $cus_id, $prod_cart_status);
							$sqlc->execute();
							$resultc = $sqlc->get_result();
							$count = $resultc->num_rows;
							$total_amount = 0;
							if ($count <= 0) {
								$cart_qty = 0;
							} else {
								while ($rowc = $resultc->fetch_assoc()) {
									$total_amount = $total_amount + $rowc['pcd_monto_total'];
								}
								$cart_qty = $count;
							}
						} else {
							$cart_qty = 0;
							$total_amount = 0;
						}
						?>

   					<?php
						if ($cliente_session== TRUE) {
						?>

   						<li class="nav-item cta cta-colored"><a href="cart.php" class="nav-link"><span class="icon-shopping_cart"></span>[<?php echo $cart_qty; ?>]</a></li>

   					<?php
						}
						?>

   					<?php
						if ($cliente_session== TRUE) {
						?>

   						<li class="nav-item dropdown">
   							<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user"></i>&nbsp;<?php echo $cus_name; ?></a>
   							<div class="dropdown-menu" aria-labelledby="dropdown04">
   								<!-- <a class="dropdown-item" href="#Modal3" data-toggle="modal" data-target="#Modal3">Edit Profile</a> -->
   								<a class="dropdown-item" href="order.php">Ordenes</a>
   								<!-- <a class="dropdown-item" href="wishlist.html">Wishlist</a> -->
   								<!-- <a class="dropdown-item" href="product-single.html">Change Password</a> -->
   								<a class="dropdown-item" href="./logout.php">Cerrar Sesion</a>
   							</div>
   						</li>

   					<?php
						} else {
						?>

   						<li class="nav-item"><a href="#" class="nav-link" data-toggle="modal" data-target="#Modal1"><i class="fas fa-sign-in-alt"></i>&nbsp;Login</a></li>
   						<!--	           <li class="nav-item"><a href="#" class="nav-link" data-toggle="modal" data-target="#Modal2"><i class="fas fa-sign-in-alt"></i>&nbsp;Register</a></li>-->

   					<?php
						}
						?>

   				</ul>
   			</div>

   	</div>
   </nav>
   <!-- END nav -->

   <!-- Modal1 -->
   <div class="modal" id="Modal1" tabindex="-1" role="dialog" data-dismiss="modal">

   	<div class="modal-center" style="position: absolute;  left: 50%;  top: 50%;  transform: translate(-50%, -50%);">
   		<div class="wrap-login100" style="margin: auto; padding: 70px 100px 30px 100px;">
   			<div class="login100-pic js-tilt" data-tilt>
   				<img src="images/modal.jpg" alt="IMG">
   			</div>

   			<form class="login100-form validate-form" action="customer_login_check.php" method="post" enctype="multipart/form-data" onsubmit="return ValidateLoginForm()">

   				<?php
					if (isset($_POST["product_details_url"])) {
					?>
   					<input type="hidden" name="product_details_url" value="<?php echo $_POST['product_details_url']; ?>">
   				<?php
					} else {
					?>
   					<input type="hidden" name="product_details_url" value="NAN">
   				<?php
					}
					?>

   				<span class="login100-form-title">
   					Login
   				</span>

   				<div class="wrap-input100 validate-input" data-validate="Username is required">
   					<input class="input100" type="text" name="login_cus_username" id="login_cus_username" placeholder="Username" minlength="6" maxlength="15" pattern="[A-Za-z0-9_]{1,15}" title="Only letters (either case), numbers, and the underscore; no more than 15 characters" required>
   					<span class="focus-input100"></span>
   					<span class="symbol-input100">
   						<i class="fas fa-user" aria-hidden="true"></i>
   						<span id="login_cus_username_error"></span>
   					</span>
   				</div>

   				<div class="wrap-input100 validate-input" data-validate="Password is required">
   					<input class="input100" type="password" name="login_cus_password" id="login_cus_password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters" minlength="6" maxlength="14" required>
   					<span class="focus-input100"></span>
   					<span class="symbol-input100">
   						<i class="fa fa-lock" aria-hidden="true"></i>
   						<span id="login_cus_password_error"></span>
   					</span>
   				</div>

   				<div class="container-login100-form-btn">
   					<button class="login100-form-btn">
   					       Inisia Sesion
   					</button>
   				</div>

   				<div class="text-center p-t-12">
   					<span class="txt1">
   						Forgot
   					</span>
   					<a class="txt2" href="#">
   						Usuario/ Contraseña?
   					</a>
   				</div>

   				<div class="text-center p-t-30">
   					<span class="txt1">
					   ¿Eres nuevo en JDV
   					</span>
   					<!-- <a class="txt2" href="customer_register.php" >
							Create an Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a> -->
   					<a class="txt2" href="customer_register.php">
					   Crear una cuenta
   						<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
   					</a>
   				</div>
   			</form>
   		</div>
   	</div>

   </div>
   <!-- END Modal1 -->



   <script type="text/javascript">
   	window.onclick = function(event) {
   		if (event.target == modal) {
   			modal.style.display = "none";
   		}
   	}
   </script>

   <script type="text/javascript">
   	function ValidateLoginForm() {
   		var login_cus_username = '';
   		var login_cus_password = '';

   		login_cus_username = fieldrequired('login_cus_username', 'login_cus_username_error', 'Username');
   		login_cus_password = fieldrequired('login_cus_password', 'login_cus_password_error', 'Password');

   		if (login_cus_username == 1 && login_cus_password == 1) {
   			return true;
   		} else {
   			return false;
   		}
   	}
   </script>