import 'package:flutter/material.dart';
import 'package:loveiscaring/main.dart';
import 'package:loveiscaring/user_profile/page/user_profile.dart';
import 'package:loveiscaring/user_profile/page/showMyNote.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        // Menambahkan clickable menu ke navigator drawer
        ListTile(
          title: const Text('Home Page'),
          onTap: () {
            // Mengarah ke homepage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        ListTile(
          title: const Text('My Profile'),
          onTap: () {
            // Mengarah ke 'Profile Page' page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const UserProfilePage()),
            );
          },
        ),
        ListTile(
          title: const Text('My Notes'),
          onTap: () {
            // Mengarah ke 'My Notes' page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ShowMyNotePage()),
            );
          },
        ),
      ],
    ),
  );
}