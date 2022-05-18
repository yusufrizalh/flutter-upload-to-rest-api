<?php
	header('Content-Type: application/json');
	header('Access-Control-Allow-Origin: *');
	header('Access-Control-Max-Age: 86400');
	header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
	header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
	header('Access-Control-Expose-Headers: Content-Length, X-JSON');

	$db = mysqli_connect('localhost', 'root', '', 'db_flutter_api');
	if(!$db) {
		echo 'database connection is failed!';
	} else {
		// echo 'database connection is success!';
	}
	
	$products = $db->query("SELECT * FROM products");
	$listProducts = array();
	
	while($rowData = $products->fetch_assoc()){
		$listProducts[] = $rowData;
	}
	
	echo json_encode($listProducts);
?>