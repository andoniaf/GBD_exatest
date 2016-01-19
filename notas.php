<h1>Notas Alumnos</h1>
<?php
$action = isset($_GET['action']) ? $_GET['action'] : "";

// Elegir los datos que deseamos recuperar de la tabla
$query = "SELECT usuario, max( nota ) as nota  "
		.	"FROM `notas` "  
		.	"GROUP BY usuario;";

// Preparamos y ejecutamos la consulta
if ($stmt = $conexion->prepare($query)) {
if (!$stmt->execute()) {
    die('Error de ejecución de la consulta. ' . $conexion->error);
} 

// recogemos los datos
$stmt->bind_result($usuario,$nota);

//cabecera de los datos mostrados
echo "<table class="."table>"; //start table
//creating our table heading
echo "<tr>";
echo "<th>Usuario</th>";
echo "<th>Nota más alta</th>";
echo "</tr>";
//recorrido por el resultado de la consulta
while ($stmt->fetch()) {
echo "<tr>";
echo "<td>$usuario</td>";
echo "<td>$nota</td>";
echo "</tr>\n";
}
// end table
echo "</table>";
$stmt->close();
} else {
die('Imposible preparar la consulta. ' . $conexion->error);
}
?> 
