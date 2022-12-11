import 'package:flutter/material.dart';
import 'package:loveiscaring/page/drawer.dart';
import 'package:loveiscaring/page/user_profile.dart';
import 'package:loveiscaring/page/showMyNote.dart';

class FormNotePage extends StatefulWidget {
  const FormNotePage({super.key});

  @override
  State<FormNotePage> createState() => _FormNotePageState();
}

class _FormNotePageState extends State<FormNotePage> {
    final _formKey = GlobalKey<FormState>();
    final _controllerNoteTitle = TextEditingController();
    final _controllerDescription = TextEditingController();

    String _title = "";
    String _description = "";

     // Dipanggil saat tombol "Save" diklik (reset form)
    void clearText() {
        _title = "";
        _description = "";
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Note Form'),
                backgroundColor: const Color(0xFFE4B654), // warna appbar
            ),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            children: [ 
                                TextFormField(
                                    autofocus: true,
                                    decoration: InputDecoration(
                                        labelText: "Title",
                                        icon: const Icon(Icons.title),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    keyboardType: TextInputType.text,

                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                        setState(() {
                                            _title = value! as String;
                                        });
                                    },
                                    // Validator
                                    validator: (String? value) {

                                        // Jika title tidak diisi
                                        if (value == null || value.isEmpty) {
                                            return 'Judul tidak boleh kosong!';
                                        }
                                        return null;
                                    },
                                ),

                                TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "Description",
                                        icon: const Icon(Icons.description_outlined),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),

                                    keyboardType: TextInputType.text,

                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                        setState(() {
                                            _description = value! as String;
                                        });
                                    },

                                    // Validator
                                    validator: (String? value) {

                                        // Jika title tidak diisi
                                        if (value == null || value.isEmpty) {
                                            return 'Deskripsi tidak boleh kosong!';
                                        }
                                        return null;
                                    },
                                ),

                                // Tombol "Simpan"
                                SizedBox(height: 12.0),
                                TextButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Color(0xFFE4B654)),
                                    ),
                                    onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                            inputDataNote(_title, _description);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const ShowMyNotePage()),
                                            );
                                            clearText();
                                        }
                                    },
                                    child: const Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}