import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loveiscaring/timeline/model/card.dart';

Future<Card> addCard(String text, String desc) async {

  final response = await http.post(
    Uri.parse(
        'https://loveiscaring.up.railway.app/timeline/add-card/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'text': text,
      'desc': desc,
    }),
  );
  return Card.fromJson(jsonDecode(response.body));
}