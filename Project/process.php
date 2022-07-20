<?php
header("Content-Type: text/html;charset=UTF-8");
 
require("env.php");

$mysqli = new mysqli($host, $user, $pw, $dbName);
 
    if($mysqli){
	echo "MySQL successfully connected!<br/>";

	$temp = $_GET['temp'];
	$humi = $_GET['humi'];
	$pir = $_GET['pir'];
	$flex = $_GET['flex'];
	$ult = $_GET['ult'];
	
	echo "<br/>Temperature = $temp<br/>";
	echo "Humidity = $humi<br/>";
	echo "PIR = $pir<br/>";
	echo "Flex = $flex<br/>";
	echo "UltraSonic = $ult<br/>";
	
	$query = "INSERT INTO data (date, temp, humidity, pir, flex, ultrasonic) VALUES (now(),'$temp','$humi','$pir','$flex','$ult')";
	mysqli_query($mysqli,$query);

	echo "</br>success!!";
    }

    else{
	echo "MySQL could not be connected";
    }

mysqli_close($mysqli);
?>
