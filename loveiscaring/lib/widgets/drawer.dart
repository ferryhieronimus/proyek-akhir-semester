import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:loveiscaring/auth/pages/login_page.dart';
import 'package:loveiscaring/auth/pages/register_page.dart';

class Hamburger extends StatelessWidget{
  const Hamburger({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Login'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyLoginPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Register'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyRegister()),
              );
            },
          ),
        ],
      ),
    );
  }
}