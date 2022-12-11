import '../models/keluhan_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

Future<List<Keluhan>> fetchKeluhan() async {
  var url = Uri.parse(
      'https://web-production-0ada.up.railway.app/pasien/riwayat-terbuka/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Keluhan> listKeluhan = [];
  for (var d in data['keluhan']) {
    if (d != null) {
      listKeluhan.add(Keluhan.fromJson(d));
    }
  }

  return listKeluhan;
}
