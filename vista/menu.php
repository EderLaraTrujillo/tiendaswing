<?php 
error_reporting(0);
session_start();

include('cabeza.php');
?>

<script src="publico/js/funciones.js"></script>

<nav id="navbar-example2" class="navbar navbar-dark bg-danger">
  <a class="navbar-brand mr-auto" href="#">Ebanisteria Ego</a>
  <ul class="nav nav-pills">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Artículos
          </a>
          <!-- aqui pondremos para ir a otra pagina (articulos, cocinas) pondremos checkbox--> 
         <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="catalogo.php#1">Cocinas</a>
            <a class="dropdown-item" href="catalogo.php#5">Alcobas</a>
            <a class="dropdown-item" href="catalogo.php#8">Accesorios</a>
            <a class="dropdown-item" href="catalogo.php#2">Comedores</a>
            <a class="dropdown-item" href="catalogo.php#8">Decoración e iluminacion</a>
            <a class="dropdown-item" href="catalogo.php">Y más...</a>
          </div>
        </li>
      <li class="nav-item">
        <a class="nav-link text-light" href="#">Cotizar</a>
      </li>
    <li class="nav-item">
      <?php 

          if (empty($_SESSION['user'])) {
             echo '<a href="" class="nav-link text-light" data-toggle="modal" data-target=".bd-example-modal-sm">Acceder</a>';
           } else{
            echo '<a href="../controlador/logout.php" class="nav-link text-light">'.$_SESSION['user'].'</a>';
           }

      ?>
    </li>
  </ul>
</nav>


<section class="container-fluid">
  <div class="row">
    
<!-- modal inicio de sesion -->
<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content bg-dark">     
      <h3 class="text-center text-primary mt-3 mb-3">Accede al Sistema</h3>
      <img src="publico/media/img/logoeba.jpg" class="rounded mx-auto d-block mb-3" alt="Logo de la Empresa" width="150" >
      <form class="col-sm-12 offset-1" id="formIngreso" method="POST">
        <div class="form-group text-center">
          <strong><em><span class="text-light bg-danger " id="ingreso"></span></em></strong>
        </div>
        <div class="form-group">
          <label for="exampleInputEmail1" class="text-white col-sm-12">Correo Electrónico</label>
          <input type="email" required name="usuario" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese su correo">
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1" class="text-white col-sm-12">Contraseña</label>
          <input type="password" required name="password" class="form-control" id="exampleInputPassword1" placeholder="Ingrese Contraseña">
        </div>
        <div class="form-check text-center">
          <input type="hidden" name="ingreso" value="1">
          <button type="button" target="parent" onclick="login()" name="formIngreso" id="formIngreso" class="form-control btn btn-primary">Acceder</button><br>
          <span class="text-white text-muted mt-2"> ¿Sin cuenta?, <a href="registro.php"> ¡Registrate Aquí!</a></span>
        </div>
      </form>
    </div>
  </div>
</div>

  </div>
</section>



