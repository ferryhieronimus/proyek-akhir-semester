// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:loveiscaring/feedback/pages/feedback_page.dart';
import 'package:provider/provider.dart';

class FeedbackdetailPage extends StatefulWidget {
  final String username;
  // final String judul;
  final String deskripsi;
  // final DateTime created;
  // final int pk;

  const FeedbackdetailPage({
    super.key,
    required this.username,
    // required this.judul,
    required this.deskripsi,
    // required this.created,
    // required this.pk,
  });
  @override
  State<FeedbackdetailPage> createState() => _FeedbackdetailPageState();
}

class _FeedbackdetailPageState extends State<FeedbackdetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.amber,
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 1000,
                child: Card(
                    color: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        side: BorderSide(color: Colors.brown)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.brown),
                                onPressed: (() {
                                  Navigator.pop(context);
                                })
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icon-profile.png",
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.username,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.amber,
                                  child: Padding(
                                      padding: const EdgeInsets.all(25),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Text(
                                          //   widget.judul,
                                          //   style: const TextStyle(
                                          //       fontSize: 20,
                                          //       fontWeight: FontWeight.bold),
                                          // ),
                                          Text(
                                            widget.deskripsi,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )))),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )),
              )
            ]),
          )),
    );
  }
}
