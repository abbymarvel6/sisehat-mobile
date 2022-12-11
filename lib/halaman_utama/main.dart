import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(6, 12, 35, 1),
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          width: 180,
        ),
      ),
      extendBody: true,
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
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40.0),
                      child: Image.asset(
                        "assets/images/About.png",
                        width: 420,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "ABOUT US",
                      style: TextStyle(
                        color: Color.fromRGBO(23, 194, 236, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Apa itu Covid Assistant ?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40),
                      child: Text(
                        "Covid Assistant (CoAss) yang merupakan aplikasi reminder dan tracking untuk pasien yang terpapar Covid-19. Tujuan dari aplikasi ini sama seperti namanya yaitu asisten untuk para pejuang Covid-19 dan membantu mereka dalam progress penyembuhan.",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF878593),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Covid Assistant",
                      style: TextStyle(
                        color: Color.fromRGBO(23, 194, 236, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tim Kami",
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
                          Text(
                            "Fitur Kami",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "Lihat semua",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF878593),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
                            itemCount: 6,
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
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.all(4.0),
                                            //   child: Hero(
                                            //       tag: fitur[index].namaFitur,
                                            //       child: Container(
                                            //         width: 200,
                                            //         height: 200,
                                            //         decoration: BoxDecoration(
                                            //             image: DecorationImage(
                                            //                 image: AssetImage(
                                            //                     fitur[index]
                                            //                         .imageUrl),
                                            //                 fit: BoxFit
                                            //                     .contain)),
                                            //       )),
                                            // ),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       left: 12, top: 4),
                                            //   child: Text(
                                            //     fitur[index].namaFitur,
                                            //     style: TextStyle(
                                            //       color:
                                            //           const Color(0xff47455f),
                                            //       fontSize: 16,
                                            //       fontWeight: FontWeight.w800,
                                            //       fontFamily: "Poppins",
                                            //     ),
                                            //   ),
                                            // ),
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
                                                      color: Color(0xFFababad),
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
                        color: Color.fromRGBO(23, 194, 236, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tulis Feedback Anda Tentang Kami",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
