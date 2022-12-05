// To parse this JSON data, do
//
//     final keluhan = keluhanFromJson(jsonString);

import 'dart:convert';

List<Keluhan> keluhanFromJson(String str) =>
    List<Keluhan>.from(json.decode(str).map((x) => Keluhan.fromJson(x)));

String keluhanToJson(List<Keluhan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Keluhan {
  Keluhan({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Keluhan.fromJson(Map<String, dynamic> json) => Keluhan(
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
    required this.tanggal,
    required this.tema,
    required this.deskripsi,
  });

  String pasien;
  String dokter;
  DateTime tanggal;
  String tema;
  String deskripsi;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        pasien: json["pasien"],
        dokter: json["dokter"],
        tanggal: DateTime.parse(json["tanggal"]),
        tema: json["tema"],
        deskripsi: json["deskripsi"],
      );

  Map<String, dynamic> toJson() => {
        "pasien": pasien,
        "dokter": dokter,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "tema": tema,
        "deskripsi": deskripsi,
      };
}
