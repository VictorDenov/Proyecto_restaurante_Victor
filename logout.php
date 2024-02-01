<?php 
	session_start();
	unset($_SESSION['cliente']);
	// session_destroy();
?>

<script>
	window.location="index.php";
</script>