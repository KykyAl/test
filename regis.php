<?php
require_once('../kendaraan/config/connect_database.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"));

    if (isset($data->username) && isset($data->password) && isset($data->nama)) {
        $username = mysqli_real_escape_string($conn, $data->username);
        $password = mysqli_real_escape_string($conn, $data->password);
        $nama = mysqli_real_escape_string($conn, $data->nama);

        // Check if the username already exists
        $check_sql = "SELECT * FROM user WHERE username = '$username'";
        $check_result = $conn->query($check_sql);

        if ($check_result->num_rows > 0) {
            http_response_code(409); // Conflict
            echo json_encode(array('message' => 'Registrasi gagal. Username sudah digunakan.'));
        } else {
            // Insert the new user into the database without hashing the password
            $sql = "INSERT INTO user (username, password, nama) VALUES ('$username', '$password', '$nama')";
            if ($conn->query($sql) === TRUE) {
                http_response_code(201); // Created
                echo json_encode(array('message' => 'Registrasi berhasil'));
            } else {
                http_response_code(500); // Internal Server Error
                echo json_encode(array('message' => 'Registrasi gagal. Terjadi kesalahan pada server.'));
            }
        }
    } else {
        http_response_code(400); // Bad Request
        echo json_encode(array('message' => 'Registrasi gagal. Data tidak lengkap.'));
    }
} else {
    http_response_code(405); // Method Not Allowed
    echo json_encode(array('message' => 'Metode HTTP tidak diizinkan'));
}