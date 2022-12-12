import 'package:flutter/material.dart';
import 'package:loveiscaring/user_profile/page/formNote.dart';

// import 'package:loveiscaring/user_profile/page/user_profile.dart';

class UserProfilePage extends StatefulWidget {
    const UserProfilePage({super.key});

    @override
    State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
    final scaffoldKey = GlobalKey<ScaffoldState>(); 

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
                title: const Text('LoveIsCaring', style: const TextStyle(color: Colors.black, fontFamily: 'Kanit')),
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
                            icon: const Icon(Icons.home),
                            onPressed: () {
                                // Navigator.pushReplacement(
                                // context,
                                // MaterialPageRoute(builder: (context) => const UserProfilePage()),
                                // );
                            },
                        ),
                    )
                ],
            ),

            body: SingleChildScrollView(
                child: Container(
                    child: Column(
                        children: [
                            Stack(
                                children: [
                                    Container(
                                        height: 5.0,
                                        width: 5.0,
                                    ),

                                    Positioned(
                                        left: 20,
                                        right: 20,
                                        child: SizedBox(
                                            child: Padding(
                                                padding: const EdgeInsets.all(20.0),
                                                child: Column(
                                                    children: [
                                                        Image.asset("assets/images/profile_pic.png"),
                                                        const SizedBox(
                                                            height: 10,
                                                        ),
                                                        Text(
                                                            'Meilany',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                            )
                                                        ),
                                                        const SizedBox(height: 9.0),
                                                        const Text(
                                                            '04/05/2003',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: Color(0xFFC49797)
                                                            )
                                                        ),
                                                        const SizedBox(height: 9.0),
                                                        const Text(
                                                            'hapsarimeilany@gmail.com',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: Color(0xFFC49797)
                                                            )
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ),

                                    ),
                                ],
                            ),
                            
                        ],
                    ),
                ),
                    
            ),
        );
    }
}

// Row(
                //     children: const [
                //         Icon(Icons.person),
                //         Text("First Name"),
                //         Text("Meilany"),
                //     ],
                // ),
                // const Divider(),
                // Row(
                //     children: const [
                //         Icon(Icons.person),
                //         SizedBox(width: 9.0),
                //         Text("Last Name"),
                //         Text("Meilany"),
                //     ],
                // ),
                // const Divider(),
                // Row(
                //     children: const [
                //         Icon(Icons.auto_awesome_rounded),
                //         SizedBox(width: 9.0),
                //         Text("Age"),
                //         Text("19"),
                //     ],
                // ),
                // const Divider(),
                // Row(
                //     children: const [
                //         Icon(Icons.calendar_month),
                //         SizedBox(width: 9.0),
                //         Text("Birth Date"),
                //         Text("04/05/2003"),

                //     ],
                // ),
                // const Divider(),
                // Row(
                //     children: const [
                //         Icon(Icons.email_outlined),
                //         SizedBox(width: 9.0),
                //         Text("Email"),
                //         Text("hapsarimeilany@gmail.com"),
                //     ],
                // ),
                // const Divider(),
                // Row(
                //     children: const [
                //         Icon(Icons.email_outlined),
                //         SizedBox(width: 9.0),
                //         Text("Phone Number"),
                //         Text("08954298450"),
                //     ],
                // ),