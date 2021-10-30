import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart-hospital/util/config.dart';

class Dokter {
  final String idDokter, nama, hp;
  Dokter({this.idDokter, this.nama, this.hp});
  factory Dokter.fromJson(map<String, dynamic> json) {
    return Dokter(
        idDokter: json['id_dokter'], nama: json['nama'], hp: json['hp']);
  }
}

List<Dokter> dokterFromJson(jsonData) {
  List<Dokter> result =
      List<Dokter>.from(jsonData.map((item) => Dokter.fromJson(item)));
  return result;
}

//index
