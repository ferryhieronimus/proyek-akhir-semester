// To parse this JSON data, do
//
//     final feedback = feedbackFromJson(jsonString);

import 'dart:convert';
// import 'dart:ffi';

List<Feedback> feedbackFromJson(String str) => List<Feedback>.from(json.decode(str).map((x) => Feedback.fromJson(x)));

String feedbackToJson(List<Feedback> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Feedback {
    Feedback({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
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
        required this.username,
        required this.desc,
        // required this.date,
        // required this.rating,
    });

    int user;
    String username;
    String desc;
    // DateTime date;
    // double rating;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        username: json["username"],
        desc: json["desc"],
        // date: DateTime.parse(json["date"]),
        // rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "username": username,
        "desc": desc,
        // "date": date.toIso8601String(),
        // "rating": rating,
    };
}
