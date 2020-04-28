/* Archivo Funciones, para el procesado de registro y edicion: */
'use strict' // Atributo para indicar que se usen funciones propias de jquery y ajax.

/* Funcion para guardar registro: */
function saveuser(){

        var registro = $('#formRegistro').serialize();

        console.log('Datos serializados: '+registro);

        $.ajax({
            type: "POST",
            url: "../controlador/registro.php",
            data: registro
        })
        .done(function(resultado){
		$("#resultado").html(resultado);
		console.log(resultado);
	})
}
/* Funcion para enviar datos de inicio de sesion: */
function login(){
    // Serializamos los dato:
    var datos = $('#formIngreso').serialize();
        // Los pasamos por ajax hacia el archivo login.php:
        $.ajax({
            type: "POST",
            url: "../controlador/login.php",
            data: datos
        })
        .done(function(ingreso){
            console.log(ingreso);
            this.ingreso = parseInt(ingreso);
            /* Condicionamos el retorno del archivo login.php, para redireccionar al usuario 
               de acuerdo al tipo de usuario:
            */
            switch(this.ingreso) {
                case 1:
                    window.location = "../vista/admin/admin.php";
                    break;
                case 2:
                    window.location = "../vista/operador/operador.php";
                    break;
                case 3:
                    window.location = "../vista/catalogo.php";
                    break;
                default:
                    $("#ingreso").html(ingreso);
                     console.log(ingreso);
                    break;
            }
    })
}