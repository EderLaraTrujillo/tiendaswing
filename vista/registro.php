<?php include('menu.php'); include('../controlador/conex.php'); ?>

<script type="text/javascript">
  $(document).ready(function(){
    $('.carousel').carousel()
  });
</script>
<!-- Funcion para guardar el usuario de forma asincrona -->
<script src="publico/js/funciones.js"></script>

<section class="container-fluid">
	<div class="row">
	<section class="col-6 mt-5 formregistro">
		<h3 class="text-center">Registrate!</h3>

		<form class="row form col-12 mt-5" id="formRegistro" method="post">
				<div class="form-group col-md-4">
				    <label for="formGroupExampleInput">Tipo Documento</label>
				    <select class="form-control" required name="tipodoc">
				    	<option value="#" disabled selected>Selecciona una Opción:</option>
				    	<?php  
				    		# Consultamos a la tabla tipodocu, que es la que tiene los tipos de docuementos en la BD:
				    		$sql = "SELECT * from tipodocu";
				    		$eje = $con->query($sql);
				    		# Mostramos a través de un ciclo todas las opciones válidas:
				    		while($row = $eje->fetch_row()){
				    			echo '<option value="'.$row[0].'">'.$row[1].'</option>';
				    		}
				    	?>
				    </select>
				</div>
				<div class="form-group col-md-4">
				    <label for="formGroupExampleInput">Número de Id:</label>
				    <input type="text" class="form-control" required  name="idusua" placeholder="Identificacion">
				</div>
				<div class="form-group col-md-4">
				    <label for="formGroupExampleInput">Nombres</label>
				    <input type="text" class="form-control" required  name="nombusua" placeholder="Nombres ">
				</div>
				<div class="form-group col-md-4">
				    <label for="formGroupExampleInput2">Apellidos</label>
				    <input type="text" class="form-control" required  name="apeusua" placeholder="Apellidos">
				</div>
				<div class="form-group col-md-4">
				    <label for="formGroupExampleInput">E-mail:</label>
				    <input type="text" class="form-control" required  name="email" placeholder="Email">
				</div>
				<div class="form-group col-md-4">
				    <label for="formGroupExampleInput2">Contraseña</label>
				    <input type="password" class="form-control" name="pass" placeholder="Password">
				</div>
				<hr>
				<h5 class="col-sm-12">Datos de contacto:</h5>
				<div class="form-group col-md-2">
				    <label for="formGroupExampleInput">Género</label>
				    <select class="form-control" required name="genero">
				    	<option value="F">Femenino</option>
				    	<option value="M">Masculino</option>
				    </select>
				</div>
				<div class="form-group col-md-4">
				    <label for="formGroupExampleInput">Fecha de Nacimiento</label>
				    <input type="date" class="form-control" name="fenace"placeholder="Example input">
				</div>
				<div class="form-group col-md-3">
				    <label for="formGroupExampleInput2">Telefono</label>
				    <input type="text" class="form-control" name="telefono" placeholder="Teléfono fijo">
				</div>
				<div class="form-group col-md-3">
				    <label for="formGroupExampleInput2">Celular</label>
				    <input type="text" class="form-control" required  name="celular" placeholder="Celular">
				</div>
				<div class="form-group col-md-12">
				    <label for="formGroupExampleInput2">Dirección de Entrega y Facturación</label>
				    <input type="text" class="form-control" required  name="direccion" placeholder="Donde recibirás tus productos o tu Factura">
				</div>
				<div class="form-group col-md-12 d-flex row justify-content-between">
					
						<button type="button"  class="btn btn-outline-primary" data-toggle="modal" data-target=".bd-example-modal-sm">Ya tienes cuenta, Ingresa...</button>
						<input type="hidden" name="registro" value="1">
						<strong><span id="resultado" class="text-light bg-success"></span></strong>
						<input type="button" onclick="saveuser()" id="registro" class="btn btn-success" value="Regístrate">
			
				</div>
			</form>

	</section>
		<section class="col-sm-6 mt-5">
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		        <ol class="carousel-indicators">
		          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		        </ol>
		        <div class="carousel-inner">
		          <div class="carousel-item text-center active">
		            <img class="rounded"  src="publico/media/img/slide/1.jpg" alt="First slide" width="800" height="500">
		            <div class="carousel-caption d-none d-md-block">
		              <h3>Cocinas</h3>
		              <p>Mas de 100 diseños aprobados</p>
		            </div>
		          </div>
		          <div class="carousel-item text-center">
		            <img class=" " src="publico/media/img/slide/2.jpg" alt="Second slide" width="800" height="500">
		            <div class="carousel-caption d-none d-md-block">
		              <h5>...</h5>
		              <p>...</p>
		            </div>
		          </div>

		          <div class="carousel-item text-center mt-0">
		            <img class=" " src="publico/media/img/slide/3.jpg" alt="Second slide" width="800" height="500">
		            <div class="carousel-caption d-none d-md-block">
		              <h5>...</h5>
		              <p>...</p>
		            </div>
		          </div>
		          <div class="carousel-item text-center">
		            <img class=" " src="publico/media/img/slide/4.jpg" alt="Third slide" width="800" height="500">
		            <div class="carousel-caption d-none d-md-block">
		              <h5>...</h5>
		              <p>...</p>
		            </div>
		          </div>
		        </div>
		        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		          <span class="sr-only">Previous</span>
		        </a>
		        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		          <span class="carousel-control-next-icon" aria-hidden="true"></span>
		          <span class="sr-only">Next</span>
		        </a>
		      </div>
		</section>
		
 </div>
</section>