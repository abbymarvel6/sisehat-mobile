import 'package:meta/meta.dart';

import 'dart:convert';

List<Penyakit> fromJson(String str) =>
    List<Penyakit>.from(json.decode(str).map((x) => Penyakit.fromJson(x)));

String toJson(List<Penyakit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Penyakit {
  Penyakit({
    @required this.pk,
    @required this.fields,
  });

  int pk;
  Fields fields;

  factory Penyakit.fromJson(Map<dynamic, dynamic> json) => Penyakit(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    @required this.pasien,
    @required this.dokter,
    @required this.nama_penyakit,
    @required this.tanggal_diagnosis,
    @required this.deskripsi_keluhan,
  });

  String pasien;
  String dokter;
  String nama_penyakit;
  String tanggal_diagnosis;
  String deskripsi_keluhan;

  factory Fields.fromJson(Map<dynamic, dynamic> json) => Fields(
        pasien: json["watched"],
        dokter: json["title"],
        nama_penyakit: json["rating"],
        tanggal_diagnosis: json["release_date"],
        deskripsi_keluhan: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "pasien": pasien,
        "dokter": dokter,
        "nama_penyakit": nama_penyakit,
        "tanggal_diagnosis": tanggal_diagnosis,
        "deskripsi_keluhan": deskripsi_keluhan,
      };
}
