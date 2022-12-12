import 'package:loveiscaring/feedback/model/feedback.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

List<Feedback> listFeedbackGlobal = [];


Future<List<Feedback>> fetchFeedback(request) async {

  listFeedbackGlobal = [];

  var url = Uri.parse('https://loveiscaring.up.railway.app/feedback/json');
  var response = await request.get(
    url,
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Feedback> listFeedback = [];
  for (var d in data) {
    if (d != null) {
      // print(d);
      listFeedback.add(Feedback.fromJson(d));
      listFeedbackGlobal.add(Feedback.fromJson(d));
    }
  }
  return listFeedback;
}

// Future<List<Feedback>> fetchFeedback() async {
//   var url = Uri.parse(
//       'https://loveiscaring.up.railway.app/timeline/json/');
//   var response = await http.get(
//     url,
//     headers: {
//       "Access-Control-Allow-Origin": "*",
//       "Content-Type": "application/json",
//     },
//   );

//   // melakukan decode response menjadi bentuk json
//   var data = jsonDecode(utf8.decode(response.bodyBytes));

//   // melakukan konversi data json menjadi object MyWatchList
//   List<Feedback> listCard = [];
//   for (var d in data) {
//     if (d != null) {
//       listCard.add(Feedback.fromJson(d));
//     }
//   }

//   return listCard;
// }
