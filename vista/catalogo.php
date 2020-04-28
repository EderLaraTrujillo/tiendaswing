<?php
include('../controlador/conex.php');
include('menu.php');
?>
<section class="container">
	<div class="row">
		<h2 class="text-center col-sm-12">CATALOGO DE PRODUCTOS</h2>
	
		<!--Php de busqueda desde la base de datos-->
		<?php 
		# Operaciones de busqueda
		$sql = "SELECT * from productos order by idtipoprod";
		$eje = $con->query($sql);
		if ($eje->num_rows >0) {
			# Buscar e imprimir:
			while ($row = $eje->fetch_row()) {
				# Listo y muestro(imprimo):
				echo '
				 <div class="card col-sm-4 mt-2" id="'.$row[1].'">
				    <img class="card-img-top" src="publico/media/img/'.$row[5].'" alt="Card image cap">
				    <div class="card-body">
				      <h5 class="card-title">'.$row[2].'</h5>
				      <p class="card-text">'.$row[3].'</p>
				      <h4 class="text-danger">$ '.number_format($row[4]).' <br><small class="text-muted"> Valor por Metro Cuadrado </small></h4>
				    </div>
				    <div class="card-footer d-flex row justify-content-between">
				      <small class="text-muted">'.$row[6].'</small>&nbsp;
				      <form method="post">
				      	<input type="hidden" name="producto" value="'.$row[0].'">
						<input type="submit" class="text-right btn btn-sm btn-danger" formaction="cotizacion.php" name="cotizacion" value="Solicitar Cotización">
					  </form>
				    </div>
				  </div>
				';
			}
		}
		?>
		
	</div>	
</section>

<form method="post"><input type="hidden" name="producto" value="$row[0]">
	<input type="submit" formaction="cotizacion.php" name="cotizacion" value="Solicitar Cotización">
</form>