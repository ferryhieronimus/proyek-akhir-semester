import 'package:flutter/material.dart';
import 'package:loveiscaring/artikel/model/artikel.dart';
import 'package:loveiscaring/artikel/model/kartu.dart';

import '../widget/response_card.dart';

class ArtikelDetail extends StatefulWidget {
  const ArtikelDetail(
      {super.key, required this.disorder, required this.disorderName});
  final String disorder, disorderName;

  @override
  State<ArtikelDetail> createState() => _ArtikelDetailState();
}

class _ArtikelDetailState extends State<ArtikelDetail> {
  Future<Artikel>? artikel;
  late Future<List<Kartu>> daftarKartu;

  @override
  void initState() {
    super.initState();
    artikel = fetchArtikel(widget.disorder);
    daftarKartu = fetchCard(widget.disorder);
  }

  @override
  Widget build(BuildContext context) {
    const double largeHeight = 20;
    const double smallHeight = 4;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.disorder,
              style: const TextStyle(color: Colors.black)),
          backgroundColor: const Color(0xfff9f9f9),
          elevation: 16.0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: artikel,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
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
                                    fontSize: 28, fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: smallHeight),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data!.subtitle,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: largeHeight),
                        Container(
                          decoration:
                              const BoxDecoration(color: Color(0xfffaf5f0)),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.deskripsi,
                                style: const TextStyle(
                                    fontSize: 16, fontFamily: 'Helvetica'),
                              ),
                              const SizedBox(height: largeHeight),
                              const Text("Bagaimana cara mencegahnya?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                snapshot.data!.subpencegah,
                                style: const TextStyle(
                                    fontSize: 16, fontFamily: 'Helvetica'),
                              ),
                              const SizedBox(height: smallHeight),
                              for (String tips in snapshot.data!.tips)
                                Text("• $tips",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Helvetica'))
                            ],
                          ),
                        ),
                        const Text("Bagaimana Tanggapan Anda?",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        FutureBuilder(
                          future: daftarKartu,
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return Center(child: CircularProgressIndicator());
                            } else if (!snapshot.hasData) {
                              return const Text("Belum ada tanggapan!");
                            } else {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return ResponseCard(
                                    height: 225,
                                    width: 200,
                                    backgroundColor: Colors.white,
                                    shadowColor: Colors.black.withOpacity(0.4),
                                    responseText:
                                        snapshot.data![index].fields.desc,
                                  );
                                },
                              );
                            }
                          },
                        ),
                        // TODO lanjutin
                      ],
                    ),
                  );
                }
              }),
        ));
  }
}
