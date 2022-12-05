import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:sisehat_mobile/dokter/models/pasien.dart';
import 'package:sisehat_mobile/dokter/page/lihat_riwayat.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

final primaryColor = Color(0xFFEAE0CC);
final secondaryColor = Color(0xFF798478);
final tertiaryColor = Color(0xFFA0A083);
final accentColor1 = Color(0xFF4D6A6D);
final accentColor2 = Color(0xFFC9ADA1);

class AddPenyakitPage extends StatefulWidget {
  const AddPenyakitPage({super.key});

  @override
  State<AddPenyakitPage> createState() => _AddPenyakitPageState();
}

class _AddPenyakitPageState extends State<AddPenyakitPage> {
  final _formKey = GlobalKey<FormState>();
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();

  Future<List<Pasien>> fetchPasien() async {
    var url = Uri.parse('http://localhost:8000/dokter/pasien/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Pasien.
    List<Pasien> listPasien = [];
    for (var d in data) {
      if (d != null) {
        listPasien.add(Pasien.fromJson(d));
      }
    }
    return listPasien;
  }

  String _pasien = "";
  String _namaPenyakit = "";
  String _pesanDokter = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LihatRiwayat()))),
        title: const Text('Input Penyakit'),
        backgroundColor: accentColor1,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: fieldText1,
                    decoration: InputDecoration(
                      hintText: "Contoh: Ambeyen",
                      labelText: "Nama Penyakit",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _namaPenyakit = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _namaPenyakit = value!;
                        fieldText1.clear();
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama penyakit tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: fieldText2,
                    decoration: InputDecoration(
                      hintText: "Contoh: Hindari ke WC.",
                      labelText: "Pesan untuk pasien...",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _pesanDokter = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _pesanDokter = value!;
                        fieldText2.clear();
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Pesan tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: FutureBuilder(
                    future: fetchPasien(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.hasData
                          ? Container(
                              child: DropdownButtonFormField<String>(
                                decoration:
                                    InputDecoration(labelText: 'Pilih Pasien'),
                                items: snapshot.data
                                    .map<DropdownMenuItem<String>>((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.pk,
                                    child: Text(item.pk),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _pasien = value!;
                                    print(value);
                                  });
                                },
                              ),
                            )
                          : Container(
                              child: Center(
                                child: Text('Loading...'),
                              ),
                            );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(accentColor1),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // simpen data
              _formKey.currentState!.save();
              // print(_judul.toString());
              // print(_nominal.toString());
              // print(tipe.toString());
              // var budget = Budget(
              //     _judul.toString(), _nominal.toString(), tipe.toString());
              // dataBudget.add(budget);
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
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        shrinkWrap: true,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text("Input penyakit berhasil."),
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
          child: const Text(
            "Simpan",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
