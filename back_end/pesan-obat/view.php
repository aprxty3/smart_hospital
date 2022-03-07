<?php
include '../db.php';

$result=null;
$id = $_GET['id'] ?? null;

$query = "SELECT * FROM pesan_obat WHERE id_pesan_obat = '$id'";

$sql = $conn->query($query);
$result_pesan_obat = $sql->fetch(PDO::FETCH_ASSOC);

$result = $result_pesan_obat;
$id_pasien = $result_pesan_obat['id_pasien'];
$result_pasien = $conn->query("SELECT * FROM pasien WHERE id_pasien = '$id_pasien'")->fetch(PDO::FETCH_ASSOC);
$result['id_pasien'] = $result_pasien;

echo json_encode($result);