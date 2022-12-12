import 'package:flutter/material.dart';
// import 'package:loveiscaring/page/drawer.dart';
import 'package:loveiscaring/user_profile/page/user_profile.dart';
import 'package:loveiscaring/user_profile/page/showMyNote.dart';

class FormNotePage extends StatefulWidget {
  const FormNotePage({super.key});

  @override
  State<FormNotePage> createState() => _FormNotePageState();
}

class _FormNotePageState extends State<FormNotePage> {
    final _formKey = GlobalKey<FormState>();
    final _controllerNoteTitle = TextEditingController();
    final _controllerDescription = TextEditingController();
    final scaffoldKey = GlobalKey<ScaffoldState>();

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
            key: scaffoldKey,
            appBar: AppBar(
                title: Text("My Notes", style: const TextStyle(color: Colors.black)),

                backgroundColor: const Color(0xfff9f9f9),
                elevation: 16.0,
                iconTheme: const IconThemeData(
                    color: Colors.black,
                ),
                leading: GestureDetector(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/logo.png", width: 3, height: 3),
                        ),
                    onTap: () {
                        if (scaffoldKey.currentState!.isDrawerOpen) {
                            scaffoldKey.currentState!.closeDrawer();
                            //close drawer, if drawer is open
                        } else {
                            scaffoldKey.currentState!.openDrawer();
                            //open drawer, if drawer is closed
                        }
                    }
                ),
                actions: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            icon: const Icon(Icons.person),
                            onPressed: () {
                                Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const UserProfilePage()),
                                );
                            },
                        ),
                    )
                ],
            ),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                            children: [ 
                                Image.asset(
                                    "assets/images/notes.png",
                                    height: 250,
                                    width: 250,
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "Title",
                                        prefixIcon: Icon(Icons.title, color: Color(0xFFE4BC66)),
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Color(0xFFE4BC66)),
                                        ),
                                        labelStyle: const TextStyle(color: Color(0xFFE4BC66)),
                                    ),
                                    keyboardType: TextInputType.text,

                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                        setState(() {
                                            _title = value!;
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

                                SizedBox(height: 15.0),

                                TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "Description",
                                        prefixIcon: Icon(Icons.description_outlined, color: Color(0xFFE4BC66)),
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: BorderSide(color: Color(0xFFE4BC66)),
                                        ),
                                        labelStyle: const TextStyle(color: Color(0xFFE4BC66)),
                                    ),

                                    keyboardType: TextInputType.text,

                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                        setState(() {
                                            _description = value!;
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
                                            )
                                            .then((_) => _formKey.currentState!.reset());
                                        }
                                    },
                                    child: const Text(
                                        "Save",
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                ),

                                SizedBox(height: 100.0),
                                Image.asset(
                                    "assets/images/logo.png",
                                    height: 20,
                                    width: 20,
                                ),
                                const Text(
                                    "love. is. caring",
                                    style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    ),
                                ),
                                const Text(
                                    "by Kelompok PBP D-12",
                                    style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
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