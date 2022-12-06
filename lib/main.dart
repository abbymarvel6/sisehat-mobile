import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SISEHAT',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SISEHAT APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(6, 12, 35, 1),
        centerTitle: true,
      ),
      
      extendBody: true,
      drawer: Drawer(
          child: Column(
            children: [
              // Menambahkan clickable menu
              ListTile(
                title: const Text('Lihat Obat')
              ),
              ListTile(
                title: const Text('Lihat Riwayat')
              ),
              ListTile(
                title: const Text('Tambah Riwayat'),
              ),
            ],
          ),
        ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(6, 12, 35, 1),
        ),
        
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Navbar(),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(232, 247, 252, 1),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "SISEHAT",
                      style: TextStyle(
                        color: Color.fromARGB(255, 7, 113, 137),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40),
                      child: Text(
                        "Aplikasi Untuk membantu anda dalam tracking obat dan riwayat kesehatan SiSehat akan membantu anda dalam progress penyembuhan dengan track record yang terstruktur.\n  Terdapat beragam fitur yang dapat anda gunakan untuk mempermudah anda dalam memanage aktivitas anda dalam progress penyembuhan Penyakit yang dialami.",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 86, 86, 98),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40.0),
  
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "ABOUT US",
                      style: TextStyle(
                        color: Color.fromARGB(255, 7, 113, 137),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Apa Itu SISEHAT ?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40),
                      child: Text(
                        "SiSehat yang merupakan aplikasi penyimpan riwayat penyakit dan tracking obat untuk pasien yang memiliki keluhan penyuakit. Tujuan dari aplikasi ini untuk mempermudah dalam tracking Obat dan riwayat penyakit dari pasien dan dokter untuk mudah mendiagnosa penyakit dan menambah kadar obat dalam progress penyembuhan.",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 86, 86, 98),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Dapat Melayani Anda Untuk",
                      style: TextStyle(
                        color: Color.fromARGB(255, 7, 113, 137),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Fitur Kami",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        ],
                      ),
                      padding: const EdgeInsets.only(bottom: 12),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, right: 10),
                                        width: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 0.3,
                                                blurRadius: 5.0)
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                             
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12, top: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Cek disini',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                      color: Color.fromARGB(255, 86, 86, 98),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color:
                                                        Color(0xFFababad),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                    Text(
                      "FEEDBACK",
                      style: TextStyle(
                        color: Color.fromARGB(255, 7, 113, 137),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tuliskan kesan-pesan dan feedback anda terhadap SISEHAT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
