import 'package:loveiscaring/user_profile/page/fetch_mycard.dart';
import 'package:loveiscaring/timeline/pages/card_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:loveiscaring/timeline/function/fetch_timeline.dart';


class MyCards extends StatefulWidget {
  const MyCards({Key? key}) : super(key: key);

  @override
  _MyCards createState() => _MyCards();
}

class _MyCards extends State<MyCards> {
  List<int> listColor = [
    0xFFFF9684, 0xFFACA355, 0xFF7F6485,
    0xFFFFB8D0, 0xFFE2BEA6, 0xFF9BB39D
  ];
  String text2 = "Login untuk melihat username";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            'My Card',
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
                  padding: const EdgeInsets.only(top: 12),
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index)=> Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: GestureDetector(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.translate(
                                offset: const Offset(-4, -4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(listColor[(snapshot.data!.length - index - 1)%6]),
                                        offset: Offset(6, 4),
                                      ),
                                    ],
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => CardDetail(indexx: snapshot.data!.length - index - 1)),
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
                                            title: Text("${snapshot.data![snapshot.data!.length - index - 1].fields.text}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                )
                                            ),
                                            subtitle: Text("${snapshot.data![snapshot.data!.length - index - 1].fields.desc}"),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Text(request.loggedIn ? "${snapshot.data![snapshot.data!.length - index - 1].fields.username}" : text2),
                                              const SizedBox(width: 8),
                                            ],
                                          ),
                                        ],
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