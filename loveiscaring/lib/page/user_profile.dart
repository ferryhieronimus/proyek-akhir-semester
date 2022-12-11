import 'package:flutter/material.dart';
import 'package:loveiscaring/page/drawer.dart';
import 'package:loveiscaring/page/formNote_userProfile.dart';
import 'package:loveiscaring/page/showMyNote.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Profile'),
                backgroundColor: const Color(0xFFE4B654), // warna appbar
            ),

            drawer: buildDrawer(context),

            body: 
            Container(
                padding: EdgeInsets.all(15.0),
                child: Center(
                    child: Column(
                        children: [
                            CircleAvatar( // Mengatur foto profile
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('assets/profile_pic.png'), 
                                radius: 50.0,
                            ),
                            // Menampilkan data di bawah foto profil
                            Text(
                                'Meilany', // ambil dari register
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                ),
                            ), 
                            Text(
                                'hapsarimeilany@gmail.com',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: const Color(0xFFBDBDBD),
                                ),
                            ),
                            Text(
                                '0895429845040',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: const Color(0xFFBDBDBD),
                                ),
                            ),
                            // Card untuk menampilkan data user
                            Container(
                                color: const Color(0xFFE4B654),
                                // jarak container data dengan tepi
                                padding: const EdgeInsets.all(25.0), 
                                child: Column(
                                    children: [
                                        Row(
                                            children: const [
                                                Icon(Icons.person),
                                                SizedBox(width: 9.0), // Jarak antara icon dan text
                                                Text('First Name'),                                                
                                                Spacer(), // Jarak antara label  dan isi data
                                                Text('Meilany'), // ambil dari register
                                                
                                            ], 
                                        ),
                                        const Divider(), // Garis pemisah antar data
                                        Row(
                                            children: const [
                                                Icon(Icons.person),
                                                SizedBox(width: 9.0),
                                                Text('Last Name'),
                                                Spacer(),
                                                Text('Hapsari'), // ambil dari register
                                            ],                                            
                                        ),
                                        const Divider(),
                                        Row(
                                            children: const [
                                                Icon(Icons.filter_vintage),
                                                SizedBox(width: 9.0),
                                                Text('Age'),
                                                Spacer(),
                                                Text('19'), // ambil dari register
                                            ],
                                        ),
                                        const Divider(),
                                        Row(
                                            children: const [
                                                Icon(Icons.calendar_month),
                                                SizedBox(width: 9.0),
                                                Text('Birth Date'),
                                                Spacer(),
                                                Text('04-05-2003'), // ambil dari register  
                                            ],
                                        ),
                                        const Divider(),
                                        Row(
                                            children: const [
                                                Icon(Icons.email_outlined),
                                                SizedBox(width: 9.0),
                                                Text('Email'),
                                                Spacer(),
                                                Text('hapsarimeilany@gmail.com'), // ambil dari register
                                            ],
                                        ),
                                        const Divider(),
                                        Row(
                                            children: const [
                                                Icon(Icons.local_phone_outlined),
                                                SizedBox(width: 9.0),
                                                Text('Phone Number'),
                                                Spacer(),
                                                Text('0895429845040'), // ambil dari register  
                                            ],                                          
                                        ),
                                    ],
                                ),
                            ),

                            // Tombol 'Create Note'
                            SizedBox(height: 9.0),
                            TextButton(
                                style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Color(0xFFE4B654)),
                                ),
                                onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const FormNotePage()),
                                    );
                                },
                                child: const Text(
                                    'Create Note',
                                    style: TextStyle(color: Colors.black, fontSize: 15),
                                ),
                            ),

                            SizedBox(height: 9.0),
                            // Tombol 'My Notes'
                            TextButton(
                                style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Color(0xFFE4B654)),
                                ),
                                onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const ShowMyNotePage()),
                                    );
                                },
                                child: const Text(
                                    'My Notes',
                                    style: TextStyle(color: Colors.black, fontSize: 15),
                                ),
                            ),
                        ],
                    )
                ),
            ),
        );
    }
}


// child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Go back!'),
//         ),