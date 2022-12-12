import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:http/http.dart' as http;
import 'package:loveiscaring/widgets/drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:loveiscaring/auth/model/auth_model.dart';
import 'package:loveiscaring/auth/pages/register_page.dart';

import '../../main.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  String username = "";
  String password1 = "";

  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  onPressed(BuildContext context, request) async {
    final response = await request
        .login("https://loveiscaring.up.railway.app/authentication/login-async/", {
      'username': username,
      'password': password1,
    });

    if (request.loggedIn) {
      // persist cookies
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Berhasil Login"),
      ));
      Navigator.pushNamed(context, "/");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Username atau Password salah!"),
      ));
    }
  }

  // @override
  // Future<List<LoveiscaringAuth>> fetchLoveiscaringAuth() async {
  //   var url = Uri.parse(
  //       'https://loveiscaring.up.railway.app/authentication/login-async');
  //   var response = await http.get(
  //     url,
  //     headers: {
  //       "Content-Type": "application/json",
  //     },
  //   );

  //   // melakukan decode response menjadi bentuk json
  //   var data = jsonDecode(utf8.decode(response.bodyBytes));

  //   // melakukan konversi data json menjadi object MyWatchList
  //   List<LoveiscaringAuth> listAuth = [];
  //   for (var d in data) {
  //     if (d != null) {
  //       listAuth.add(LoveiscaringAuth.fromJson(d));
  //     }
  //   }

  //   return listAuth;
  // }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
      //drawer: const Hamburger(),
      body: Form(
        key: _loginFormKey,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login.png'),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 35, top: 130),
                  child: const Text(
                    'Welcome\nBack',
                    style: TextStyle(color: Colors.black, fontSize: 33),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: "Username",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                onChanged: (String? value) {
                                  setState(() {
                                    username = value!;
                                  });
                                },
                                onSaved: (String? value) {
                                  setState(() {
                                    username = value!;
                                  });
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username tidak boleh kosong!';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                  style: const TextStyle(),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "Password",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  onChanged: (String? value) {
                                    setState(() {
                                      password1 = value!;
                                    });
                                  },
                                  onSaved: (String? value) {
                                    setState(() {
                                      password1 = value!;
                                    });
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password tidak boleh kosong!';
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Sign in',
                                    style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Color(0xff4c505b),
                                    child: IconButton(
                                        color: Colors.white,
                                        onPressed: () async {
                                          if (_loginFormKey.currentState!
                                              .validate()) {
                                            onPressed(context, request);
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward,
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/register");
                                    },
                                    style: const ButtonStyle(),
                                    child: const Text(
                                      'Sign Up',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Color(0xff4c505b),
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
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
