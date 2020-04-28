<?php
# Metodo para el tratamiento de notificaciones:
error_reporting(0);
# Objeto conexion a la base de datos:
include('conex.php');

# Validacion de obturacion del boton:
if (isset($_POST['registro'])) {
	
	# Captura de variables:
	$tipo = $_POST['tipousua'];
	$id =$_POST['idusua'];
	$nombres = $_POST['nombusua'];
	$apellidos = $_POST['apeusua'];
	$email = $_POST['email'];
	$password = $_POST['pass'];
	$tipodocu = $_POST['tipodoc'];
	$genero = $_POST['genero'];
	$fenace = $_POST['fenace'];
	$telefono = $_POST['telefono'];
	$celular = $_POST['celular'];
	$direccion = $_POST['direccion'];


	# Definimos las constantes del procedimiento:
	if (empty($tipo)) {
		# Para el caso del tipo de usuario, si no lo enviamos, Definiremos nuestro tipo de usuario:
		$tipo= 3; //En este caso el tipo del usuario es 3,porque es el que se ha definido como cliente
	}else{
		$tipo = $_POST['tipousua'];
	}
	# Constante de opcion para el procedimiento almacenado:
	$opcion = 'guardar';

	# Validamos que los campos que no son obligatorios (telefono y/o fax), se conviertan en un dato numerico, en este caso '0':
	if (empty($telefono)) {
		# Asignamos el valor 0:
		$telefono = 0; 
	}
	// En este caso, no se ha agregado el campo fax en la base de datos, pero de estar, solo se debe repetir la ultima validacion if..
	# Ejecutamos la primer consulta para la insersion en la tabla usuario:
	$sql ="CALL crudUsuario('$id', '$tipo','$nombres', '$apellidos', '$email', '$password', '$opcion')";
	$eje = $con->query($sql);
	# Validamos que tengamos un valor true en el envío a la base de datos y la respectiva retroalimentación:
	if ($row = $eje->fetch_row()) {
		# Si el resultado de la ultima consulta es mayor a 0, entonces hemos guardado en ambas tablas. Por lo tanto mostramos el mensaje de usuario guardado:
		echo $row[0];	
	}else{
		$msj = 'Ha ocurrido un error al guardar el usuario';
		echo $msj;
	}
}
?>
<!-- Instrucciones para guardar en la otra tabla -->
<?php
# Aqui repetimos el objeto $con, ya que en la ejecucion anterior no se ha liberado y nos genera error al guardar en la otra tabla:
include('conex.php');
	# dEnviamos los datos que corresponden al procedimiento almacenado de la otra tabla:
	$sql = "call DatoUsua('$tipodocu', '$tipo', '$id', '$genero', '$fenace', '$direccion', '$telefono', '$celular', '$opcion')";
	$eje = $con->query($sql);
	$res = $eje->fetch_row();

?>