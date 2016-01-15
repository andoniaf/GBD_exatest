<?php

$sql = "SELECT * "
            . "FROM preguntas ";
    $result = $conexion->query($sql);
    echo '<FORM action="calificar.php" method="post">';
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
        echo "<input type='radio' name='$ipd' value='1'> $op1 <br>";
        echo "<input type='radio' name='$ipd' value='2'> $op2 <br>";
        echo "<input type='radio' name='$ipd' value='3'> $op3 <br>";
	echo "<input type='radio' name='$ipd' value='4'> $op4 <br>";
	echo "<hr>";
    }
    echo '<input type="submit" value="Enviar y corregir">';
    echo '</FORM>';

