import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loveiscaring/timeline/pages/timeline.dart';
import 'package:loveiscaring/timeline/function/add_timeline.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class TambahCardPage extends StatefulWidget {
  const TambahCardPage({super.key});

  @override
  State<TambahCardPage> createState() => _TambahCardPageState();
}

class _TambahCardPageState extends State<TambahCardPage> {
  final _formKey = GlobalKey<FormState>();
  String? _text;
  String? desc;

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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Pesan",
                      labelText: "Pesan",
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _text = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _text = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Deskripsi Singkat",
                      labelText: "Deskripsi Singkat",
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        desc = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        desc = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFCEA16A),
                      padding: const EdgeInsets.all(15.0),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.post(
                          'https://loveiscaring.up.railway.app/timeline/add-card/',
                          {
                            'text': _text,
                            'desc': desc,
                          },
                        );
                      }
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
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