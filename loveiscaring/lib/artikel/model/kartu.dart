// To parse this JSON data, do
//
//     final artikel = artikelFromJson(jsonString);
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Kartu> cardFromJson(String str) =>
    List<Kartu>.from(json.decode(str).map((x) => Kartu.fromJson(x)));

String cardToJson(List<Kartu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kartu {
  Kartu({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Kartu.fromJson(Map<String, dynamic> json) => Kartu(
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
    required this.desc,
    required this.tipe,
  });

  String desc;
  int tipe;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        desc: json["desc"],
        tipe: json["tipe"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "tipe": tipe,
      };
}

Future<List<Kartu>> fetchCard(String disorder) async {
  Map<String, int> peta = {
    "depression": 0,
    "anxiety": 1,
    "schizophrenia": 2,
    "eating": 3,
    "mood": 4,
    "ptsd": 5
  };
  var uri = Uri.parse("https://loveiscaring.up.railway.app/artikel/json/${peta[disorder]}");
  var response = await http.get(
    uri,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
      'Accept': '*/*',
    },
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<Kartu> listcard = [];
  for (var each in data) {
    if (each != null) {
      listcard.add(Kartu.fromJson(each));
    }
  }
  return listcard;
}
