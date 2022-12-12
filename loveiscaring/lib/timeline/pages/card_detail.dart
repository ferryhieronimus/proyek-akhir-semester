import 'package:loveiscaring/timeline/function/fetch_timeline.dart';
import 'package:loveiscaring/timeline/pages/add_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class CardDetail extends StatelessWidget {
  CardDetail({Key? key, required this.indexx}) : super(key: key);

  final int indexx;
  @override

  List<int> listColor = [
    0xFFFF9684, 0xFFACA355, 0xFF7F6485,
    0xFFFFB8D0, 0xFFE2BEA6, 0xFF9BB39D
  ];

  String text2 = "Login untuk melihat username";

  @override
  Widget build(BuildContext context) {

    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            'Timeline',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color(0xfff9f9f9),
          elevation: 4.0,
        ),
        body: FutureBuilder(
            future: fetchCard(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  color: Color(0xfffaf5f0),
                  child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 240),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Transform.translate(
                                  offset: const Offset(-4, -4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(listColor[(indexx)%6]),
                                          offset: Offset(6, 4),
                                        ),
                                      ],
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => const TambahCardPage()),
                                        );
                                      },
                                      child: Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                          side: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              title: Text("${snapshot.data![indexx].fields.text}",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  )
                                              ),
                                              subtitle: Text("${snapshot.data![indexx].fields.desc}"),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                                Text(request.loggedIn ? "${snapshot.data![indexx].fields.username}" : text2),
                                                const SizedBox(width: 8),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                );
              }
            }
        ),
    );
  }
}