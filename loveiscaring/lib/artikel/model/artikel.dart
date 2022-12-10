import 'package:http/http.dart' as http;
import 'dart:convert';

Artikel artikelFromJson(String str) => Artikel.fromJson(json.decode(str));

String artikelToJson(Artikel data) => json.encode(data.toJson());

Future<Artikel> fetchArtikel(String disorderName) async {
  var uri = Uri.parse("http://localhost:8000/artikel/${disorderName}_json/");

  var response = await http.get(
    uri,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  Artikel artikel = Artikel.fromJson(data);

  return artikel;
}

class Artikel {
  Artikel({
    required this.title,
    required this.subtitle,
    required this.deskripsi,
    required this.subpencegah,
    required this.tips,
    required this.tipe,
    required this.islogin,
  });

  String title;
  String subtitle;
  String deskripsi;
  String subpencegah;
  List<String> tips;
  int tipe;
  bool islogin;

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        title: json["title"],
        subtitle: json["subtitle"],
        deskripsi: json["deskripsi"],
        subpencegah: json["subpencegah"],
        tips: List<String>.from(json["tips"].map((x) => x)),
        tipe: json["tipe"],
        islogin: json["islogin"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "deskripsi": deskripsi,
        "subpencegah": subpencegah,
        "tips": List<dynamic>.from(tips.map((x) => x)),
        "tipe": tipe,
        "islogin": islogin,
      };
}
