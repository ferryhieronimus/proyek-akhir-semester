import 'package:flutter/material.dart';
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
                title: const Text('LoveIsCaring', style: const TextStyle(color: Colors.black, fontFamily: 'Kanit')),
            
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
                            icon: const Icon(Icons.home),
                            onPressed: () {
                                Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const UserProfilePage()),
                                );
                            },
                        ),
                    )
                ],
                backgroundColor: const Color(0xfff9f9f9),
                elevation: 16.0,
                iconTheme: const IconThemeData(
                    color: Colors.black,
                ),
            ),
        

            // drawer: buildDrawer(context),

            body: SingleChildScrollView(
                
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                        child: Column(
                            children: [
                                CircleAvatar( // Mengatur foto profile
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage('assets/images/profile_pic.png'), 
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
                                        color: const Color(0xFFADA2A2),
                                    ),
                                ),
                                Text(
                                    '0895429845040',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: const Color(0xFFADA2A2),
                                    ),
                                ),
                                // Card untuk menampilkan data user
                                Container(
                                    color: const Color(0xFFE4BC66),
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
                                            backgroundColor: MaterialStateProperty.all(Color(0xFFE4BC66)),
                                    ),
                                    onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const FormNotePage()),
                                        );
                                    },
                                    child: const Text(
                                        'Create Note',
                                        style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                ),

                                SizedBox(height: 9.0),
                                // Tombol 'My Notes'
                                TextButton(
                                    style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Color(0xFFE4BC66)),
                                    ),
                                    onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const ShowMyNotePage()),
                                        );
                                    },
                                    child: const Text(
                                        'My Notes',
                                        style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                ),

                                SizedBox(height: 25.0),
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
                        )
                    ),
                
            ),
        );
    }
}
