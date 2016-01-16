<?php
$now = date("F j, Y, g:i a");;
$user = $_REQUEST['usuario'];
$p1 = $_REQUEST['1'];
$p2 = $_REQUEST['2'];
$p3 = $_REQUEST['3'];
$p4 = $_REQUEST['4'];
$p5 = $_REQUEST['5'];
echo $p1," - ",$p2," - ",$p3," - ",$p4," - ",$p5;
echo "<br/>".$user.$now; //Linea de entorno de pruebas, borrar al terminar
	
//Despues de mostrar las respuestas se guardan
$sql="REPLACE respuestas "
        . "(usuario, idPregunta, idOpcion, time) "
        . "VALUES "
        . "('$usuario',1,$p1,'$now'), "
        . "('$usuario',2,$p2,'$now'), "
        . "('$usuario',3,$p3,'$now'), "
        . "('$usuario',4,$p4,'$now'); ";
//Conectar con la base de datos
include 'conexion.php';
$conexion->query($sql);

	


