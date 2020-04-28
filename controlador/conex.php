<?php
# Archivo para la conexion a la base de datos
#Variables

$server="127.0.0.1"; //
$user="root";
$password="";
$basedatos="ebanisteria";
$port=3306;
$socket="";

#contructor de objeto conexion:

$con = new mysqli($server, $user, $password, $basedatos, $port, $socket)
	or die ('No se puede conectar la base de datos o al servidor' .mysql_connect_error());
$acentos= $con->query('SET NAMES UTF8');

?>