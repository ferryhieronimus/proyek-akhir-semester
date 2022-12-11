import 'package:loveiscaring/timeline/function/fetch_timeline.dart';
import 'package:loveiscaring/timeline/pages/add_card.dart';
import 'package:flutter/material.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  _TimelinePage createState() => _TimelinePage();
}

class _TimelinePage extends State<TimelinePage> {
  List<int> listColor = [
    0xFFFF9684, 0xFFACA355, 0xFF7F6485,
    0xFFFFB8D0, 0xFFE2BEA6, 0xFF9BB39D
  ];
  @override
  Widget build(BuildContext context) {
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
                  return ListView.builder(
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
                                        color: Color(listColor[index%6]),
                                        offset: Offset(6, 4),
                                      ),
                                    ],
                                  ),
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
                                          title: Text("${snapshot.data![index].fields.text}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                              )
                                          ),
                                          subtitle: Text("${snapshot.data![index].fields.desc}"),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text("${snapshot.data![index].fields.username}"),
                                            const SizedBox(width: 8),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  );
              }
            }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TambahCardPage()),
            );
          },
          backgroundColor: const Color(0xFFCEA16A),
          child: const Icon(Icons.add),
        )
    );
  }
}