<?php
if (checkexattempts($_SESSION['usuario'], $conexion)){
    echo "<br/> Ya tienes 3 intentos. Alea jacta est";
} else {
    $sql = "SELECT * "
		. "FROM preguntas ";
	$result = $conexion->query($sql);
	echo '<FORM action="index.php?action=calificar" method="post">';
	echo "<input type=\"hidden\" name=\"usuario\" value=\"".$_SESSION['usuario']."\">";
	while ($fila = $result->fetch_assoc()) {
	    //cogemos la pregunta y las opciones
	    $idp = $fila['idPregunta'];
	    $pregunta = $fila['descripcion'];
	    $op1 = $fila['opcion1'];
	    $op2 = $fila['opcion2'];
	    $op3 = $fila['opcion3'];        
	    $op4 = $fila['opcion4'];

	    //las presentamos
	    echo '<b>'.$idp.' - '.$pregunta.' :</b><br>';
	    echo "<input type='radio' name='$idp' value='1'> $op1 <br>";
	    echo "<input type='radio' name='$idp' value='2'> $op2 <br>";
	    echo "<input type='radio' name='$idp' value='3'> $op3 <br>";
	    echo "<input type='radio' name='$idp' value='4'> $op4 <br>";
	    echo "<hr>";
	}
	echo '<input type="submit" value="Enviar y corregir">';
	echo '</FORM>';
}
?>