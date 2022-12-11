import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

List<Penyakit> fromJson(String str) =>
    List<Penyakit>.from(json.decode(str).map((x) => Penyakit.fromJson(x)));

String toJson(List<Penyakit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Penyakit {
  Penyakit({
    required this.id,
    required this.pasien,
    required this.dokter,
    required this.diagnosis,
    required this.tanggal,
    required this.deskripsi,
  });

  int id;
  String pasien;
  String dokter;
  String diagnosis;
  String tanggal;
  String deskripsi;

  factory Penyakit.fromJson(Map<dynamic, dynamic> json) => Penyakit(
        id: json["id"],
        pasien: json["pasien_id"],
        dokter: json["dokter_id"],
        diagnosis: json["nama_penyakit"],
        tanggal: json["tanggal_diagnosis"],
        deskripsi: json["deskripsi_keluhan"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "pasien": pasien,
        "dokter": dokter,
        "diagnosis": diagnosis,
        "tanggal": tanggal,
        "deskripsi": deskripsi,
      };
}
