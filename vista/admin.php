<?php
session_start();
include('cabeza.php');

 ?>

 <h1 class="dispay-3">Hola Administrador <?php echo $_SESSION['user']; ?> </h1>
 