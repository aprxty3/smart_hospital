import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_hospital/util/config.dart';
import 'package:smart_hospital/util/session.dart';
import 'package:http/http.dart' as http;
import 'pasien.dart';
import 'dokter.dart';

class RegisPoli {
  final String idRegisPoli, tglBooking, poli;
  final Pasien idPasien;
  final Dokter idDokter;
  RegisPoli(
      {this.idRegisPoli,
      this.idPasien,
      this.idDokter,
      this.tglBooking,
      this.poli});

  factory RegisPoli.fromJson(Map<String, dynamic> json) {
    return RegisPoli(
        idRegisPoli: json['id_regis_poli'],
        idPasien: Pasien.fromJson(json['id_pasien']),
        idDokter: Dokter.fromJson(json['id_dokter']),
        tglBooking: json['tgl_booking'],
        poli: json['poli']);
  }
}

List<RegisPoli> regisPoliFromJson(jsonData) {
  List<RegisPoli> result =
      List<RegisPoli>.from(jsonData.map((item) => RegisPoli.fromJson(item)));
  return result;
}

//index (POST)
Future<List<RegisPoli>> fetchRegisPolis() async {
  final prefs = await SharedPreferences.getInstance();
  String idPasien = prefs.getString(ID_PASIEN) ?? "";
  String route =
      AppConfig.API_ENDPOINT + "regis-poli/index.php?id_pasien=$idPasien";
  final response = await http.get(route);

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return regisPoliFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}

//create (POST)