<?php
include('conex.php');

session_start(); 
$clienteId = $_SESSION['iduser'];

$qry = "SELECT c.*, ifnull(max(ct.numecoti)+1,1) as numecoti 
		from cliente c
		join cotizacion ct 
		where idusuario = '$clienteId' limit 1";
$exe =  $con->query($qyr);
$fil = $exe->fetch_row();
?>
<?php
	
	# Incluimos la conexion a la base de datos
	
	
	
	echo "";	
?>
<form method="post">
	<input type="hidden" value="$clienteId" name="iduser">
	<input type="hidden" value="2" name="tipotran">
	<input type="hidden" value="3" name="tipousua">
	<div class="col-sm-9"></div>
	<div class="col-sm-2">Numero de Documento:
		
	
</div>
	<div class="form-control">
		<input type="text">
	</div>
</form>