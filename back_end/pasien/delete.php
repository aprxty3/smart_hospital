<?php
include '../db.php';

$response=null;
try {
    
    $id = $_GET['id'];
    $query = "DELETE FROM pasien WHERE id_pasien = '$id'";
    
    $stmt = $conn->prepare($query);
    $stmt->execute();
    $response['message'] = "Pasien berhasil dihapus";  

}catch (Exception $e){
    $response['message'] = "Gagal : ".$e->getMessage();
}

echo json_encode($response);