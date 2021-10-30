import 'package:flutter/material.dart';
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
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
Future<List<Dokter>> fetchDokter() async {
  String route = AppConfig.API_ENDPOINT + "dokter/index.php";
  final response = await http.get(route);
  if (response.statusCode == 200) {
    var jsonResp = jsonDecode(response.body);
    return dokterFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
