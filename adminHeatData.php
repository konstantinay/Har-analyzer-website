<?php
	session_start();

	$con = mysqli_connect('localhost', 'root','') or die (mysqli_conect_errno());  
    mysqli_select_db($con, 'web');

    $q1 = "SELECT latitude as 'lat', longitude as 'lng', username as 'name' FROM `ip_visited_test` ";
	$res1= mysqli_query($con, $q1);

	$q2 = "SELECT DISTINCT username as 'cname', lat as 'clat', lon as 'clng' FROM `ipuserdata` ";
	$res2 = mysqli_query($con, $q2);

	$q3 = "SELECT username as 'name1', server_Ip, latitude as 'lat1', longitude as 'long1', COUNT(latitude AND longitude) as plithos FROM `ip_visited_test` GROUP BY server_Ip ORDER BY plithos DESC";
	$res3 = mysqli_query($con, $q3);

	$q4 = "SELECT COUNT(DISTINCT server_Ip) as 'count' from ip_visited_test";
	$res4 = mysqli_query($con, $q4);

	$fetchData1 = mysqli_fetch_all($res1, MYSQLI_ASSOC);
	$fetchData2 = mysqli_fetch_all($res2, MYSQLI_ASSOC);
	$fetchData3 = mysqli_fetch_all($res3, MYSQLI_ASSOC);
	$fetchData4 = mysqli_fetch_all($res4, MYSQLI_ASSOC);

	header('Content-Type: application/json');
	echo json_encode(array($fetchData1,$fetchData2,$fetchData3,$fetchData4));

	mysqli_close($con);
?>
