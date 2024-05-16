<?php
require_once('../kendaraan/config/connect_database.php');
$target_dir = "img/"; // Direktori tempat gambar akan disimpan
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]); // Nama file target
$uploadOk = 1; // Flag untuk menandakan apakah pengunggahan berhasil atau tidak

if ($_SERVER['REQUEST_METHOD'] != 'POST') {
    echo json_encode(
        array('error' => 'Method salah')

    );
    # code...
} else {
    $image = $_FILES["fileToUpload"]["tmp_name"];

    move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
    echo json_encode($image);
}