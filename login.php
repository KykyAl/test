<?php
require_once('../kendaraan/config/connect_database.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"));

    if (isset($data->username) && isset($data->password)) {
        $username = mysqli_real_escape_string($conn, $data->username);
        $password = mysqli_real_escape_string($conn, $data->password);

        $sql = "SELECT * FROM user WHERE username = '$username' AND password = '$password'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            http_response_code(200); // OK
            echo json_encode(array('message' => 'Login berhasil', 'user' => $user));
        } else {
            http_response_code(401); // Unauthorized
            echo json_encode(array('message' => 'Login gagal. Kredensial tidak valid.'));
        }
    } else {
        http_response_code(400); // Bad Request
        echo json_encode(array('message' => 'Login gagal. Data tidak lengkap.'));
    }
} else {
    http_response_code(405); // Method Not Allowed
    echo json_encode(array('message' => 'Metode HTTP tidak diizinkan'));
}