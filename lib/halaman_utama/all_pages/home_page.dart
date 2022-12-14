import 'package:flutter/material.dart';
import 'package:sisehat_mobile/halaman_utama/all_pages/feedback_page.dart';
import 'package:sisehat_mobile/halaman_utama/all_pages/instance_login.dart';
import 'package:sisehat_mobile/halaman_utama/all_widgets/feedback_widget.dart';
import 'package:sisehat_mobile/halaman_utama/all_widgets/fitur_widget.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

// class InitHomePage extends StatelessWidget {
//   const InitHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//         create: (_) {
//           CookieRequest request = CookieRequest();
//           return request;
//         },
//         child: MaterialApp(
//           title: 'Lihat Riwayat',
//           home: HomePage(""),
//           routes: {
//             "/login": (BuildContext context) => const instanceLogin(),
//           },
//         ));
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState(title: title);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 224, 204),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 186, 179, 163),
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 72, 65, 65),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: Color.fromARGB(255, 72, 65, 65),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Color.fromARGB(255, 72, 65, 65),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: Color.fromARGB(255, 72, 65, 65),
            ),
            label: '',
          ),
        ],
      ),
      resizeToAvoidBottomInset: false, // set it to false
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome to,",
                          style: TextStyle(
                            color: Color.fromARGB(255, 72, 65, 65),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          " Sisehat!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 72, 65, 65),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage("lib/assets/user.png"),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
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
                        "lib/assets/surgeon.png",
                        width: 92,
                        height: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Apa yang kamu keluhkan?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 72, 65, 65),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const SizedBox(
                            width: 250,
                            child: Text(
                              "Tanya dokter, dan keluhkan kepada dokter sekarang juga!",
                              style: TextStyle(
                                color: Color.fromARGB(255, 72, 65, 65),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 150,
                            height: 35,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(1000, 77, 106, 109),
                                borderRadius: BorderRadius.circular(12.0)),
                            child: const Center(
                              child: Text(
                                "Tambah keluhan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 64,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(65, 28, 27, 24),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "lib/assets/healthcare.png",
                        width: 50,
                        height: 170,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        "Apa yang anda butuhkan? coba cek fitur!",
                        style: TextStyle(
                          color: Color.fromARGB(255, 72, 65, 65),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      fitur_widget(
                        imagePath: "lib/assets/capsules.png",
                        imageName: "Lihat Obat",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: const fitur_widget(
                          imagePath: "lib/assets/medical-record.png",
                          imageName: "Lihat Riwayat",
                        ),
                        onTap: () {
                          if (title == "Dokter") {
                            Navigator.pop(
                              context,
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: Container(
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Center(
                                            child: Text(
                                                "Anda harus login sebagai Dokter terlebih dahulu. Silahkan login ulang."),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Kembali'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: fitur_widget(
                          imagePath: "lib/assets/tambahkeluhan.png",
                          imageName: "Tambah keluhan",
                        ),
                        onTap: () {
                          if (title == "Pasien") {
                            Navigator.pop(
                              context,
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: Container(
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Center(
                                            child: Text(
                                                "Anda harus login sebagai Pasien terlebih dahulu. Silahkan login ulang."),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Kembali'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Feedback APP!",
                        style: TextStyle(
                          color: Color.fromARGB(255, 72, 65, 65),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Color.fromARGB(255, 72, 65, 65),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        feedback_widget(
                          image: "lib/assets/feedback.png",
                          judul: "Lihat Feedback",
                          keterangan: "klik disini!",
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => feedbackPage(title: title)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  child: SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        feedback_widget(
                          image: "lib/assets/logout.png",
                          judul: "Logout",
                          keterangan: "klik disini!",
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    final response = await request.get(
                        'https://web-production-0ada.up.railway.app/auth/logout/');

                    if (response["status"]) {
                      request.loggedIn = false;
                      request.jsonData = {};
                      request.cookies = {};
                      print("LOGGEDIN? " + request.loggedIn.toString());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const instanceLogin()),
                      );
                    } else {
                      request.loggedIn = true;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
