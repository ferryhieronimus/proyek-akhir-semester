// To parse this JSON data, do
//
//     final loveiscaringAuth = loveiscaringAuthFromJson(jsonString);

import 'dart:convert';

LoveiscaringAuth loveiscaringAuthFromJson(String str) => LoveiscaringAuth.fromJson(json.decode(str));

String loveiscaringAuthToJson(LoveiscaringAuth data) => json.encode(data.toJson());

class LoveiscaringAuth {
    LoveiscaringAuth({
        required this.status,
        required this.message,
    });

    bool status;
    String message;

    factory LoveiscaringAuth.fromJson(Map<String, dynamic> json) => LoveiscaringAuth(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
