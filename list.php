<?php
// Sertakan konfigurasi database
require_once('../kendaraan/config/connect_database.php');

// Mendapatkan data pengguna dari database
function getUsers()
{
    global $conn;
    $sql = "SELECT * FROM kendaraan";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $users = array();
        while ($row = $result->fetch_assoc()) {
            $users[] = $row;
        }
        return $users;
    } else {
        return array();
    }
}

// Tangani permintaan HTTP
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $users = getUsers();

    // Mengembalikan respons JSON
    header('Content-Type: application/json');
    if (!empty($users)) {
        echo json_encode(array('status' => '00', 'message' => 'Berhasil mendapatkan data', 'data' => $users));
    } else {
        echo json_encode(array('status' => '01', 'message' => 'Tidak ada data ditemukan', 'data' => $users));
    }
} else {
    http_response_code(405);
    echo json_encode(array('status' => '02', 'message' => 'Metode HTTP tidak diizinkan'));
}