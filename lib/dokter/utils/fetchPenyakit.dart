import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/penyakit.dart';

Future<List<Penyakit>> fetchPenyakit() async {
  var url =
      Uri.parse('https://web-production-0ada.up.railway.app/dokter/penyakit/');
  // var url = Uri.parse('http://localhost:8000/dokter/penyakit/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Penyakit.
  List<Penyakit> listPenyakit = [];
  for (var d in data) {
    if (d != null) {
      listPenyakit.add(Penyakit.fromJson(d));
    }
  }
  return listPenyakit;
}
