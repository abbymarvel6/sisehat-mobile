import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../../registrasi/logindokter.dart';
import '../../registrasi/signupdokter.dart';
import '../../registrasi/signuppasien.dart';

class RiwayatPageDrawer extends StatefulWidget {
  const RiwayatPageDrawer({super.key});

  @override
  State<RiwayatPageDrawer> createState() => RiwayatPageDrawerState();
}

class RiwayatPageDrawerState extends State<RiwayatPageDrawer> {
  bool _visibility = true;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('Halaman Utama'),
            onTap: () async {
              // Route ke halaman utama
            },
          ),
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Log Out'),
            onTap: () async {
              // Route menu ke halaman utama
              final response = await request.get(
                  'https://web-production-0ada.up.railway.app/auth/logout/');

              if (response["status"]) {
                request.loggedIn = false;
                request.jsonData = {};
                request.cookies = {};
                print("LOGGEDIN? " + request.loggedIn.toString());
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const DocLoginPage()),
                );
              } else {
                request.loggedIn = true;
              }
            },
          ),
          // ListTile(
          //   title: const Text('Log In Dokter'),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => const DocLoginPage()),
          //     );
          //   },
          // ),
          // ListTile(
          //   title: const Text('Sign Up Dokter'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const DocSignupPage()),
          //     );
          //   },
          // ),
          // ListTile(
          //   title: const Text('Sign Up Pasien'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const PatSignupPage()),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
