import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

List<Keluhan> fromJson(String str) =>
    List<Keluhan>.from(json.decode(str).map((x) => Keluhan.fromJson(x)));

String toJson(List<Keluhan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Keluhan {
  Keluhan({
    required this.id,
    required this.pasien,
    required this.dokter,
    required this.tema,
    required this.tanggal,
    required this.deskripsi,
  });

  int id;
  String pasien;
  String dokter;
  String tema;
  String tanggal;
  String deskripsi;

  factory Keluhan.fromJson(Map<dynamic, dynamic> json) => Keluhan(
        id: json["id"],
        pasien: json["pasien_id"],
        dokter: json["dokter_id"],
        tema: json["tema"],
        tanggal: json["tanggal"],
        deskripsi: json["deskripsi"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "pasien": pasien,
        "dokter": dokter,
        "tema": tema,
        "tanggal": tanggal,
        "deskripsi": deskripsi,
      };
}
