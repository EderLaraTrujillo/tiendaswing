<?php  
error_reporting(0);
session_start();
if (empty($_SESSION['user'])) {
    header('location:../index.php');
}
?>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Ebanisteria Ego</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="../publico/media/img/logoeba.jpg">
    <link rel="stylesheet" href="../publico/css/app.css">
    <link rel="stylesheet" href="../publico/css/bootstrap.css">
    <link href="../publico/css/open-iconic-bootstrap.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Architects+Daughter|Sedgwick+Ave" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Architects+Daughter|Sedgwick+Ave" rel="stylesheet">
    <script src="../publico/js/jquery.js"></script>
    <script src="../publico/js/app.js"></script>
    <script src="../publico/js/popper.js"></script>
    
  </head>
  <body class="inicio">
    <!-- Optional JavaScript -->
    <script src="../publico/js/jquery.js"></script>
    <script src="../publico/js/app.js"></script>
    <script src="../publico/js/popper.js"></script>
    <script src="../publico/js/bootstrap.js"></script>