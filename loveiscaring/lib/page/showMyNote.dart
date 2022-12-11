import 'package:flutter/material.dart';
import 'package:loveiscaring/page/drawer.dart';
import 'package:loveiscaring/page/user_profile.dart';


class ShowMyNotePage extends StatefulWidget {
    const ShowMyNotePage({super.key});

    @override
    State<ShowMyNotePage> createState() => _showMyNotePageState();
}

class _showMyNotePageState extends State<ShowMyNotePage> {

    // Daftar-daftar data yang disimpan
    static List<String> daftarJudul = [];
    static List<String> daftarDeskripsi = [];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('My Notes'),
                backgroundColor: const Color(0xFFE4B654), // warna appbar
            ),

            drawer: buildDrawer(context),

            body:ListView.builder(
                itemBuilder: (context, index) {
                    return Card(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                children:[

                                    // Judul note
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                                daftarJudul[index], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.left),
                                            ),
                                    ),
                                ],
                                children: [
                                    // Deskripsi note
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                                daftarDeskripsi[index], style: TextStyle(fontSize: 15),
                                                textAlign: TextAlign.left),
                                        ),
                                    ),   
                                ],
                            )
                        ),
                    );
                },
                itemCount: daftarJudul.length,
            ),
        );
    }
}

// memasukkan setiap data ke dalam array untuk ditampilkan
void inputDataNote(String title, String description) { 
    _showMyNotePageState.daftarJudul.add(title);
    _showMyNotePageState.daftarDeskripsi.add(description);
}