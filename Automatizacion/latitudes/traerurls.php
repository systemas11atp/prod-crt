<?php
require_once '/var/www/vhosts/' . $_SERVER['HTTP_HOST'] . '/httpdocs/Automatizacion/database/dbSelectors.php';

$selectBDD = selectBDD();
$dbname    = $selectBDD[dbname];
$username  = $selectBDD[username];
$password  = $selectBDD[password];
$db_index = "prstshp_";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
$contentType = isset($_SERVER["CONTENT_TYPE"]) ? trim($_SERVER["CONTENT_TYPE"]) : '';
$content = trim(file_get_contents("php://input"));
$decodedT = json_decode($content, true);
if(!is_array($decodedT)){
	throw new Exception('Received content contained invalid JSON!');
}

$info = $decodedT[info];

$listado = [];
$cuentele = 0;
if($info == "estados"){
	$sql_total = "SELECT estado FROM codigos_postales_generales GROUP BY estado ORDER BY estado asc";
	$result = $conn->query($sql_total);
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			$estado = utf8_encode($row[estado]);
			$eljson = array( 
				"estado"=> "{$estado}"
			);
			$listado[$cuentele] = $eljson;
			$cuentele++;
		}
	}
}else if($info == "ciudades"){
	$estado = utf8_decode($decodedT[estado]);
	$sql_total = "SELECT ciudad FROM codigos_postales_generales WHERE estado = '{$estado}' GROUP BY ciudad ORDER BY ciudad asc";
	$result = $conn->query($sql_total);
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			$ciudad = utf8_encode($row[ciudad]);
			$eljson = array( 
				"ciudad"=> "{$ciudad}"
			);
			$listado[$cuentele] = $eljson;
			$cuentele++;
		}
	}
}else{
	$estado = utf8_decode($decodedT[estado]);
	$ciudad = utf8_decode($decodedT[ciudad]);
	$sql_total = "SELECT * FROM codigos_postales_generales WHERE estado = '{$estado}' AND ciudad = '{$ciudad}' GROUP BY codigo_postal ORDER BY codigo_postal asc";
	$result = $conn->query($sql_total);
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			$cp = $row[codigo_postal];
			$sql = "SELECT * FROM codigos_postales_generales WHERE estado = '{$estado}' AND ciudad = '{$ciudad}' AND codigo_postal = {$cp} ORDER BY asentamiento asc";
			$result2 = $conn->query($sql);
			$eljson = [];
			$cuentaJson = 0;
			if ($result2->num_rows > 0) {
				while($row2 = $result2->fetch_assoc()) {
					$as =  utf8_encode($row2[asentamiento]);
					$as =  str_replace("??", "a", $as);
					$as =  str_replace("??", "A", $as);
					$as =  str_replace("??", "e", $as);
					$as =  str_replace("??", "E", $as);
					$as =  str_replace("??", "i", $as);
					$as =  str_replace("??", "I", $as);
					$as =  str_replace("??", "o", $as);
					$as =  str_replace("??", "O", $as);
					$as =  str_replace("??", "u", $as);
					$as =  str_replace("??", "U", $as);
					$as =  strtolower($as);
					//$as = urlencode($as);

					$mp =  utf8_encode($row2[municipio]);
					$mp =  str_replace("??", "a", $mp);
					$mp =  str_replace("??", "A", $mp);
					$mp =  str_replace("??", "e", $mp);
					$mp =  str_replace("??", "E", $mp);
					$mp =  str_replace("??", "i", $mp);
					$mp =  str_replace("??", "I", $mp);
					$mp =  str_replace("??", "o", $mp);
					$mp =  str_replace("??", "O", $mp);
					$mp =  str_replace("??", "u", $mp);
					$mp =  str_replace("??", "U", $mp);
					$mp =  strtolower($mp);
					//$mp = urlencode($mp);

					$ed =  utf8_encode($row2[estado]);
					$ed =  str_replace("??", "a", $ed);
					$ed =  str_replace("??", "A", $ed);
					$ed =  str_replace("??", "e", $ed);
					$ed =  str_replace("??", "E", $ed);
					$ed =  str_replace("??", "i", $ed);
					$ed =  str_replace("??", "I", $ed);
					$ed =  str_replace("??", "o", $ed);
					$ed =  str_replace("??", "O", $ed);
					$ed =  str_replace("??", "u", $ed);
					$ed =  str_replace("??", "U", $ed);
					$ed =  strtolower($ed);
					//$ed = urlencode($ed);

					$cd =  utf8_encode($row2[ciudad]);
					$cd =  str_replace("??", "a", $cd);
					$cd =  str_replace("??", "A", $cd);
					$cd =  str_replace("??", "e", $cd);
					$cd =  str_replace("??", "E", $cd);
					$cd =  str_replace("??", "i", $cd);
					$cd =  str_replace("??", "I", $cd);
					$cd =  str_replace("??", "o", $cd);
					$cd =  str_replace("??", "O", $cd);
					$cd =  str_replace("??", "u", $cd);
					$cd =  str_replace("??", "U", $cd);
					$cd =  strtolower($cd);
					//$cd = urlencode($cd);

					$eljson[$cuentaJson] = array( 
						"asentamiento"=> "{$as}",
						"municipio"=> "{$mp}",
						"estado"=> "{$ed}",
						"ciudad"=> "{$cd}"
					);
					$cuentaJson++;
				}
			}
			$njson = array( 
				"{$cp}"=> $eljson
			);
			$listado[$cuentele] = $njson;
			$cuentele++;
		}
	}
}
print_r(json_encode($listado));
?>
