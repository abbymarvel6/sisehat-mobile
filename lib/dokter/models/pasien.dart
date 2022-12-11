// To parse this JSON data, do
//
//     final pasien = pasienFromJson(jsonString);

import 'dart:convert';

List<Pasien> pasienFromJson(String str) =>
    List<Pasien>.from(json.decode(str).map((x) => Pasien.fromJson(x)));

String pasienToJson(List<Pasien> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pasien {
  Pasien({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  String pk;
  Fields fields;

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
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
    required this.user,
  });

  int user;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
      };
}
