import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

Future<List<String>> fetchDokter() async {
  var url = Uri.parse(
      'https://web-production-0ada.up.railway.app/pasien/daftar-dokter/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<String> listDokter = [];
  for (var d in data) {
    if (d != null) {
      listDokter.add(d['pk']);
    }
  }

  return listDokter;
}
