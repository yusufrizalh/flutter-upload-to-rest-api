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
		echo 'database connection is success!';
	}
	
	$name = $_POST['product_name'];
	$price = $_POST['product_price'];
	$image = $_FILES['product_image']['product_name'];
	
	$imagePath = 'uploads/'.$image;
	$tmp_name = $_FILES['product_image']['tmp_name'];
	
	move_uploaded_file($tmp_name, $imagePath);
	
	$db->query("INSERT INTO products(product_name, product_price, product_image) VALUES('".$name."', '".$price."', '".$image."')");
?>