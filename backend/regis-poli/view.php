<?php
include '../db.php';

$result=null;
$id = $_GET['id'];

$query = "SELECT * FROM regis_poli WHERE id_regis_poli = '$id'";

$sql = $conn->query($query);
$result_regis_poli = $sql->fetch(PDO::FETCH_ASSOC);

$result = $result_regis_poli;
$id_pasien = $result_regis_poli['id_pasien'];
$result_pasien = $conn->query("SELECT * FROM pasien WHERE id_pasien = '$id_pasien'")->fetch(PDO::FETCH_ASSOC);
$result['id_pasien'] = $result_pasien;

$id_dokter = $result_regis_poli['id_dokter'];
$result_dokter = $conn->query("SELECT * FROM dokter WHERE id_dokter = '$id_dokter'")->fetch(PDO::FETCH_ASSOC);
$result['id_dokter'] = $result_dokter;

echo json_encode($result);