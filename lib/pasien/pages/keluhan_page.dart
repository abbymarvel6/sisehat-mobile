import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart';
import 'package:sisehat_mobile/pasien/pages/home_page.dart';
import 'package:sisehat_mobile/pasien/utils/fetch_dokter.dart';

import '../utils/colors.dart';
import '../utils/text_styles.dart';
import '../utils/interface_helpers.dart';
import '../widgets/daftar_keluhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MengeluhPage extends StatefulWidget {
  @override
  _MengeluhPageState createState() => _MengeluhPageState();
}

class _MengeluhPageState extends State<MengeluhPage> {
  final _formKey = GlobalKey<FormState>();

  String tema = "";
  String deskripsi = "";

  List<String> daftarDokter = ['A', 'B', 'C', 'D', 'E', 'F', 'KI'];
  late String pilihDokter;

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: extraInvertColorsStrong(context),
      body: FutureBuilder(
        future: fetchDokter(),
        builder: (context, AsyncSnapshot snapshot) {
          daftarDokter = snapshot.data;
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    top: 50.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          (Icons.backspace_rounded),
                        ),
                        tooltip: 'Go back',
                        color: invertColorsStrong(context),
                        iconSize: 26.0,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                        },
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          'kembali',
                          style: isThemeCurrentlyDark(context)
                              ? TitleStylesDefault.white
                              : TitleStylesDefault.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: [
                        Padding(
                            // Menggunakan padding sebesar 8 pixel
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Tema",
                                // Menambahkan icon agar lebih intuitif
                                icon: const Icon(Icons.class_),
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String value) {
                                setState(() {
                                  tema = value;
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  if (value != null) {
                                    tema = value!;
                                  }
                                });
                              },
                              // Validator form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nama lengkap tidak boleh kosong';
                                }
                                return null;
                              },
                            )),
                        Padding(
                            // Menggunakan padding sebesar 8 pixel
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Deskripsi",
                                // Menambahkan icon agar lebih intuitif
                                icon: const Icon(Icons.class_),
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String value) {
                                setState(() {
                                  deskripsi = value;
                                });
                              },
                              // Menambahkan behavior saat data disimpan
                              onSaved: (String? value) {
                                setState(() {
                                  if (value != null) {
                                    deskripsi = value!;
                                  }
                                });
                              },
                              // Validator form
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nama lengkap tidak boleh kosong';
                                }
                                return null;
                              },
                            )),
                        if (snapshot.data == null || snapshot.data.isEmpty)
                          Center(child: CircularProgressIndicator())
                        else
                          ListTile(
                            leading: const Icon(Icons.people),
                            title: const Text(
                              'Dokter',
                            ),
                            trailing: DropdownButton(
                              value: daftarDokter[0],
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: daftarDokter.map((String items) {
                                pilihDokter = daftarDokter[0];
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    pilihDokter = newValue!;
                                  }
                                });
                              },
                            ),
                          ),
                        TextButton(
                          child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState != null) {
                              if (_formKey.currentState!.validate()) {
                                makePostRequest(pilihDokter, tema, deskripsi);
                              }
                            }
                          },
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

makePostRequest(String dokter, String tema, String deskripsi) async {
  print("LOOK HERE");
  final uri = Uri.parse('http://127.0.0.1:8000/pasien/mengeluh/');
  final headers = {'Content-Type': 'application/json'};
  Map<String, dynamic> body = {
    'pasien': 'anonymous user',
    'dokter': dokter,
    'tanggal': '2022-12-14',
    'tema': tema,
    'deskripsi': deskripsi
  };
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  Response response = await post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );

  int statusCode = response.statusCode;
  String responseBody = response.body;
}
