// To parse this JSON data, do
//
//     final feedbackModels = feedbackModelsFromJson(jsonString);

import 'dart:convert';

List<FeedbackModels> feedbackModelsFromJson(String str) => List<FeedbackModels>.from(json.decode(str).map((x) => FeedbackModels.fromJson(x)));

String feedbackModelsToJson(List<FeedbackModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedbackModels {
    FeedbackModels({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory FeedbackModels.fromJson(Map<String, dynamic> json) => FeedbackModels(
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
        required this.name,
        required this.message,
    });

    String name;
    String message;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
    };
}
