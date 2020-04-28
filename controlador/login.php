<?php
session_start();
#conexion a la base de datos:
include('conex.php');

# Condicionamos cuando oprima el boton 
if (isset($_POST['ingreso'])) {
	# llamamos los datos del formulario:...
	$usuario = $_POST['usuario'];
	$password=$_POST['password'];

	# Consultamos en la base de datos para ver si el usuario esta registrado:
	$sql = "SELECT idUsuario, idTipoUsua, concat(Nombres, ' ', Apellidos) as user from usuario where Email = '$usuario' and Password = '$password' and EstaUsua = 'Activo'";
	$eje = $con->query($sql);
	# validacion de la exitencia del usuario:
	if ($eje->num_rows > 0) {
		# Traemos el resultado, como este puede ser mas de uno, lo organizaremos por tipo de usuario para poder decidir:
		$row = $eje->fetch_row();

		# Definicion de parametros de la sesion:
		$_SESSION['iduser'] = $row[0]; // Id del usuario, para luego usar en las transacciones o cotizaciones:
		$_SESSION['tipo'] = $row[1]; // Tipo de usuario, para poder redirigir la sesion
		$_SESSION['user'] = $row[2]; // Usuario, para mostrar en la barra de menú.

		switch ($_SESSION['tipo']) {
			case '1':
				# imprimimos para la toma de decision desde el javascript:
				echo $_SESSION['tipo'];
				# header('location:../vista/admin/admin.php');
				break;

			default:
				# imprimimos para la toma de decision desde el javascript:
				echo $_SESSION['tipo'];
				# header('location:../vista/catalogo.php');
				break;
		}
	}else{
		echo "El usuario no se encuentra registrado";
		//echo $sql;
	}

}

?>

