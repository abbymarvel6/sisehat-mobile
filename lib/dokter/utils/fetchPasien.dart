import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/pasien.dart';

Future<List<Pasien>> fetchPasien() async {
  var url =
      Uri.parse('https://web-production-0ada.up.railway.app/dokter/pasien/');
  // var url = Uri.parse('http://localhost:8000/dokter/pasien/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Pasien.
  List<Pasien> listPasien = [];
  for (var d in data) {
    if (d != null) {
      listPasien.add(Pasien.fromJson(d));
    }
  }
  return listPasien;
}
