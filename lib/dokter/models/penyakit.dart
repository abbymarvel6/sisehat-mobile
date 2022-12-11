// To parse this JSON data, do
//
//     final penyakit = penyakitFromJson(jsonString);

import 'dart:convert';

List<Penyakit> penyakitFromJson(String str) =>
    List<Penyakit>.from(json.decode(str).map((x) => Penyakit.fromJson(x)));

String penyakitToJson(List<Penyakit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Penyakit {
  Penyakit({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Penyakit.fromJson(Map<String, dynamic> json) => Penyakit(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.pasien,
    required this.dokter,
    required this.namaPenyakit,
    required this.tanggalDiagnosis,
    required this.deskripsiKeluhan,
    required this.sembuh,
  });

  String pasien;
  String dokter;
  String namaPenyakit;
  DateTime tanggalDiagnosis;
  String deskripsiKeluhan;
  bool sembuh;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        pasien: json["pasien"],
        dokter: json["dokter"],
        namaPenyakit: json["nama_penyakit"],
        tanggalDiagnosis: DateTime.parse(json["tanggal_diagnosis"]),
        deskripsiKeluhan: json["deskripsi_keluhan"],
        sembuh: json["sembuh"],
      );

  Map<String, dynamic> toJson() => {
        "pasien": pasien,
        "dokter": dokter,
        "nama_penyakit": namaPenyakit,
        "tanggal_diagnosis":
            "${tanggalDiagnosis.year.toString().padLeft(4, '0')}-${tanggalDiagnosis.month.toString().padLeft(2, '0')}-${tanggalDiagnosis.day.toString().padLeft(2, '0')}",
        "deskripsi_keluhan": deskripsiKeluhan,
        "sembuh": sembuh,
      };
}
