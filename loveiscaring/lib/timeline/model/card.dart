// To parse this JSON data, do
//
//     final card = cardFromJson(jsonString);

import 'dart:convert';

List<Card> cardFromJson(String str) => List<Card>.from(json.decode(str).map((x) => Card.fromJson(x)));

String cardToJson(List<Card> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Card {
  Card({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    model: modelValues.map[json["model"]],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse[model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.user,
    required this.username,
    required this.text,
    required this.desc,
  });

  int user;
  String username;
  String text;
  String desc;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    username: json["username"],
    text: json["text"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "username": username,
    "text": text,
    "desc": desc,
  };
}

enum Model { TIMELINE_CARDS }

final modelValues = EnumValues({
  "timeline.cards": Model.TIMELINE_CARDS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
