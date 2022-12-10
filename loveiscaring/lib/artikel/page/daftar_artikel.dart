import 'package:flutter/material.dart';

import 'package:loveiscaring/artikel/page/artikel_detail.dart';
// import 'package:loveiscaring/widget/drawer.dart';
import 'package:loveiscaring/artikel/model/artikel.dart';

class DaftarArtikelPage extends StatefulWidget {
  const DaftarArtikelPage({Key? key}) : super(key: key);

  @override
  State<DaftarArtikelPage> createState() => _DaftarArtikelPageState();
}

class _DaftarArtikelPageState extends State<DaftarArtikelPage> {
  List listed = [
    'anxiety',
    'depression',
    'schizophrenia',
    'eating',
    'mood',
    'ptsd'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Artikel'),
        ),
        //drawer: const MyDrawer(),
        body: ListView.builder(
            itemCount: listed.length,
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ArtikelDetail(disorder: listed[index])));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 5)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                listed[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
