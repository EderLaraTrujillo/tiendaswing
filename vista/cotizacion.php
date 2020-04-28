<?php
session_start();
if (empty($_SESSION['user'])) {
	header('location:registro.php');
}
include('menu.php');

$clienteId = $_SESSION['iduser'];
include('../controlador/conex.php');

$producto = $_POST['producto'];

$sql = "SELECT * from catalogo where idProductos = '$producto'";
$eje = $con->query($sql);
$row = $eje->fetch_row();

$prodname = $row[2].' '.$row[3];
$fotoprod = $row[5];
$tipoprod = $row[7];

?>
<section class="container">
	<div class="row">
		
		<section class="col-sm-5 mt-2 text-center">
			<div class="card text-white bg-primary mb-3" style="max-width: 22rem;">
			  <div class="card-header"><h3><?php echo $tipoprod; ?></h3></div>
			  <div class="card-body">
			    <img src="publico/media/img/<?php echo $fotoprod; ?>" class="img-fluid" height="500">
			    <p class="card-text"><?php echo $prodname; ?></p>
			  </div>
			</div>
		</section>		
			<?php
				# Incluimos la conexion a la base de datos
				/*include('../controlador/conex.php');

				$qry = "SELECT * FROM cliente where idusuario = '$clienteId' limit 1";
				$exe =  $con->query($qyr);
				$fil = $exe->fetch_row();*/
			?>
		<section class="col-sm-7 mt-2">
			Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore quasi dolorem assumenda inventore expedita aliquam deserunt modi repellat earum sed, corporis sint praesentium at consequuntur obcaecati reprehenderit, maxime exercitationem ipsam.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse deserunt, iure quasi quod facilis sint, delectus iusto est? Soluta corrupti illo ea tempore explicabo atque, eligendi vel praesentium quia placeat.
			<form method="post">
				
			</form>
		</section>

	</div>
</section>

