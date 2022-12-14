import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sisehat_mobile/halaman_utama/all_pages/feedback_page.dart';
import 'package:sisehat_mobile/halaman_utama/all_widgets/feedback_widget.dart';
import 'package:sisehat_mobile/halaman_utama/all_widgets/fitur_widget.dart';
import 'package:sisehat_mobile/registrasi/logindokter.dart';
import 'package:sisehat_mobile/registrasi/signupdokter.dart';

import '../../registrasi/loginpasien.dart';
import '../../registrasi/signuppasien.dart';

void main() => runApp(InitInstanceLogin());

class InitInstanceLogin extends StatelessWidget {
  const InitInstanceLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: 'Lihat Riwayat',
          home: const instanceLogin(),
          routes: {
            "/login": (BuildContext context) => const DocLoginPage(),
          },
        ));
  }
}

class instanceLogin extends StatefulWidget {
  const instanceLogin({Key? key}) : super(key: key);

  @override
  State<instanceLogin> createState() => _instanceLoginState();
}

class _instanceLoginState extends State<instanceLogin> {
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 224, 204),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(1000, 77, 106, 109),
        title: Text('Login As!'),
        automaticallyImplyLeading: false,
      ),
      // appBar: AppBar(
      //   title: Text('FEEDBACK APP!'),
      //   backgroundColor: Color.fromARGB(1000, 77, 106, 109),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 12),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(65, 28, 27, 24),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "lib/assets/doctor.png",
                        width: 92,
                        height: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "LOGIN SEBAGAI DOKTER",
                            style: TextStyle(
                                color: Color.fromARGB(255, 72, 65, 65),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            child: Container(
                              width: 150,
                              height: 35,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(1000, 77, 106, 109),
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DocLoginPage()),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            child: Container(
                              width: 150,
                              height: 35,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(1000, 77, 106, 109),
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: const Center(
                                child: Text(
                                  "Sign up!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DocSignupPage()),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(65, 28, 27, 24),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "lib/assets/patient.png",
                        width: 92,
                        height: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "LOGIN SEBAGAI PASIEN",
                            style: TextStyle(
                                color: Color.fromARGB(255, 72, 65, 65),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            child: Container(
                              width: 150,
                              height: 35,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(1000, 77, 106, 109),
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PatLoginPage()),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            child: Container(
                              width: 150,
                              height: 35,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(1000, 77, 106, 109),
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: const Center(
                                child: Text(
                                  "Sign up!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PatSignupPage()),
                              );
                            },
                          )
                        ],
                      ),
                    ],
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
