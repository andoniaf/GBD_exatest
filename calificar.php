<?php
$now = date("F j, Y, g:i:s a");;
$user = $_REQUEST['usuario'];
$p1 = $_REQUEST['1'];
$p2 = $_REQUEST['2'];
$p3 = $_REQUEST['3'];
$p4 = $_REQUEST['4'];
$p5 = $_REQUEST['5'];

//Aseguramos que aunque no este respondida haya un valor.
if (empty($p1)) $p1=0;
if (empty($p2)) $p2=0;
if (empty($p3)) $p3=0;
if (empty($p4)) $p4=0;
if (empty($p5)) $p5=0;

//Mostramos los resultados
echo $p1," - ",$p2," - ",$p3," - ",$p4," - ",$p5;
echo "<br/>".$user.$now; //Linea de entorno de pruebas, borrar al terminar
	
//Despues de mostrar las respuestas se guardan
$sql="INSERT INTO respuestas "
        . "(usuario, idPregunta, idOpcion, time) "
        . "VALUES "
        . "('$usuario',1,$p1,'$now'), "
        . "('$usuario',2,$p2,'$now'), "
        . "('$usuario',3,$p3,'$now'), "
        . "('$usuario',4,$p4,'$now'); ";
//Conectar con la base de datos
include 'conexion.php';
$conexion->query($sql);

//Corregimos y mostramos la nota
$sql = "SELECT preguntas.opcion_true as a, respuestas.idOpcion as b "
        . "FROM preguntas, respuestas "
        . "WHERE respuestas.usuario='$usuario' AND preguntas.idPregunta=respuestas.idPregunta ";
echo  "<br>".$sql . "<br>"; //Linea de entorno de pruebas, borrar al terminar
$result = $conexion->query($sql);
$blanco = 0;
$aciertos = 0;
$errores = 0;
while ($fila = $result->fetch_assoc()) {
    if ($fila['b'] == 0) {
        $blanco++;
    } elseif ($fila['b'] == $fila['a']) {
        $aciertos++;
    } else {
        $errores++;
    }
    echo $fila['a'],"==>",$fila['b'],"<br>";
}
echo " Has tenido $aciertos aciertos, $errores errores. ";

	


