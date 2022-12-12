import 'package:flutter/material.dart';
// import 'package:loveiscaring/page/drawer.dart';
import 'package:loveiscaring/user_profile/page/user_profile.dart';
import 'package:loveiscaring/user_profile/page/formNote_userProfile.dart';

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
                title: const Text(
                    'My Notes',
                    style: const TextStyle(color: Colors.black)
                ),
                backgroundColor: const Color(0xfff9f9f9),
                elevation: 16.0,
                iconTheme: const IconThemeData(
                    color: Colors.black,
                ),
            ),

            body:ListView.builder(
                itemCount: daftarJudul.length,
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
            ),
        );
    }
}

// memasukkan setiap data ke dalam array untuk ditampilkan
void inputDataNote(String title, String description) { 
    _showMyNotePageState.daftarJudul.add(title);
    _showMyNotePageState.daftarDeskripsi.add(description);
}