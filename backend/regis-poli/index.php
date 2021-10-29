<?php
include '../db.php';
$result=null;
$id_pasien = $_GET['id_pasien'] ?? null;
$query = "SELECT * FROM regis_poli";

if ($id_pasien!=null){
    $query = $query."  WHERE id_pasien = '$id_pasien'";
}

$sql = $conn->query($query);
$result_regis_poli = $sql->fetchAll(PDO::FETCH_ASSOC);
$result = $result_regis_poli;

foreach ($result as $i => $regis) {
    $id_pasien = $regis['id_pasien'];
    $result_pasien = $conn->query("SELECT * FROM pasien WHERE id_pasien = '$id_pasien'")->fetch(PDO::FETCH_ASSOC);
    $result[$i]['id_dokter'] = $result_dokter;
}
echo json_encode($result);