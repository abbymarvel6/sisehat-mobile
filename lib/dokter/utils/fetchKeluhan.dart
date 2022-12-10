import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/keluhan.dart';

Future<List<Keluhan>> fetchKeluhan() async {
  var url =
      Uri.parse('https://web-production-0ada.up.railway.app/dokter/keluhan/');
  // var url = Uri.parse('http://localhost:8000/dokter/keluhan/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Keluhan.
  List<Keluhan> listKeluhan = [];
  for (var d in data) {
    if (d != null) {
      listKeluhan.add(Keluhan.fromJson(d));
    }
  }
  return listKeluhan;
}
