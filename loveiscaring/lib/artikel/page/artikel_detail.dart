import 'package:flutter/material.dart';
import 'package:loveiscaring/artikel/model/artikel.dart';

class ArtikelDetail extends StatefulWidget {
  const ArtikelDetail({super.key, required this.disorder});
  final String disorder;

  @override
  State<ArtikelDetail> createState() => _ArtikelDetailState();
}

class _ArtikelDetailState extends State<ArtikelDetail> {
  late Future<Artikel> artikel;

  @override
  void initState() {
    super.initState();
    artikel = fetchArtikel(widget.disorder);
  }

  @override
  Widget build(BuildContext context) {
    const double largeHeight = 20;
    const double smallHeight = 4;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.disorder),
        ),
        body: FutureBuilder(
            future: artikel,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  margin: const EdgeInsets.all(7.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: largeHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              snapshot.data!.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: smallHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              snapshot.data!.subtitle,
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: largeHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              snapshot.data!.deskripsi,
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      // TODO lanjutin
                    ],
                  ),
                );
              }
            }));
  }
}
