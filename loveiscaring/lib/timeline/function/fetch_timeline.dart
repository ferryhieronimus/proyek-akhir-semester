import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loveiscaring/timeline/model/card.dart';

Future<List<Card>> fetchCard() async {
  var url = Uri.parse(
      'https://loveiscaring.up.railway.app/timeline/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchList
  List<Card> listCard = [];
  for (var d in data) {
    if (d != null) {
      listCard.add(Card.fromJson(d));
    }
  }

  return listCard;
}