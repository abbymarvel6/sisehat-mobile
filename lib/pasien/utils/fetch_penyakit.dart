import '../models/penyakit_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

Future<List<Penyakit>> fetchPenyakit() async {
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

  List<Penyakit> listPenyakit = [];
  for (var d in data['penyakit']) {
    if (d != null) {
      listPenyakit.add(Penyakit.fromJson(d));
    }
  }

  return listPenyakit;
}
