import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:http/http.dart' as http;

import '../utils/fetchPasien.dart';
import 'package:sisehat_mobile/dokter/page/lihat_riwayat.dart';

final primaryColor = Color(0xFFEAE0CC);
final secondaryColor = Color(0xFF798478);
final tertiaryColor = Color(0xFFA0A083);
final accentColor1 = Color(0xFF4D6A6D);
final accentColor2 = Color(0xFFC9ADA1);

class AddPenyakitPage extends StatefulWidget {
  AddPenyakitPage({super.key, required this.username});

  late String username;

  @override
  State<AddPenyakitPage> createState() =>
      // _AddPenyakitPageState(request: request);
      _AddPenyakitPageState(username: username);
}

class _AddPenyakitPageState extends State<AddPenyakitPage> {
  _AddPenyakitPageState({required this.username});

  late String username;
  final _formKey = GlobalKey<FormState>();
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();

  void addPenyakit(
      username, String pasien, String namaPenyakit, String pesanDokter) async {
    var url = Uri.parse(
        'https://web-production-0ada.up.railway.app/dokter/add-penyakit-mobile/$pasien');

    var map = <String, dynamic>{};
    map["nama_penyakit"] = namaPenyakit;
    map["deskripsi_keluhan"] = pesanDokter;
    map["username"] = username;

    var response = await http.post(url, body: map);

    print(response.body);
  }

  String _pasien = "";
  String _namaPenyakit = "";
  String _pesanDokter = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    print("FP LOGGEDIN? ${request.loggedIn}");
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LihatRiwayatPage(username: username)))),
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
              print(_pasien.toString());
              print(_namaPenyakit.toString());
              print(_pesanDokter.toString());
              addPenyakit(username, _pasien, _namaPenyakit, _pesanDokter);
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
