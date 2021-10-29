<?php
include '../db.php';

$response=null;
try {
    if ($_SERVER['REQUEST_METHOD']=='POST'){
        $id = $_GET['id'];
        $nama = $_POST['Pasien']['nama'];
        $hp = $_POST['Pasien']['hp'];
        $email = $_POST['Pasien']['email'];
        
        $query = "UPDATE pasien SET nama = ?, hp = ?, email = ? WHERE id_pasien = '$id'";
        
        $stmt = $conn->prepare($query);
        $stmt->execute([$nama, $hp, $email]);
        $response['message'] = "Pasien berhasil diperbarui";  
    }
}catch (Exception $e){
    $response['message'] = "Gagal : ".$e->getMessage();
}

echo json_encode($response);