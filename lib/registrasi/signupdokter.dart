import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'dart:convert';

import 'package:sisehat_mobile/dokter/page/lihat_riwayat.dart';
import 'package:sisehat_mobile/halaman_utama/all_pages/instance_login.dart';
import 'package:sisehat_mobile/registrasi/logindokter.dart';

final primaryColor = Color(0xFFEAE0CC);
final secondaryColor = Color(0xFF798478);
final tertiaryColor = Color(0xFFA0A083);
final accentColor1 = Color(0xFF4D6A6D);
final accentColor2 = Color(0xFFC9ADA1);

class DocSignupPage extends StatefulWidget {
  const DocSignupPage({super.key});

  @override
  State<DocSignupPage> createState() => _DocSignupPageState();
}

class _DocSignupPageState extends State<DocSignupPage> {
  final _formKey = GlobalKey<FormState>();
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();
  final fieldText3 = TextEditingController();
  final fieldText4 = TextEditingController();
  final fieldText5 = TextEditingController();

  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String _username = "";
  String _nik = "";
  String _asalRs = "";
  String _password1 = "";
  String _password2 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const instanceLogin()),
            );
          },
        ),
        title: const Text('Sign Up as Dokter'),
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
                      hintText: "Username",
                      labelText: "Username",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _username = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _username = value!;
                        fieldText1.clear();
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Username tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    maxLength: 16,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: fieldText4,
                    decoration: InputDecoration(
                      hintText: "16 Digit NIK",
                      labelText: "NIK",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _nik = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nik = value!;
                        fieldText1.clear();
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'NIK tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: fieldText5,
                    decoration: InputDecoration(
                      hintText: "Asal Rumah Sakit",
                      labelText: "Asal Rumah Sakit",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat judul diketik
                    onChanged: (String? value) {
                      setState(() {
                        _asalRs = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _asalRs = value!;
                        fieldText1.clear();
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Asal Rumah Sakit tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: fieldText2,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        color: Color.fromRGBO(200, 200, 200, 1),
                        splashRadius: 1,
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: togglePasswordView,
                      ),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // Menambahkan behavior saat password diketik
                    onChanged: (String? value) {
                      setState(() {
                        _password1 = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _password1 = value!;
                        fieldText2.clear();
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: TextFormField(
                    controller: fieldText3,
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        color: Color.fromRGBO(200, 200, 200, 1),
                        splashRadius: 1,
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: togglePasswordView,
                      ),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // Menambahkan behavior saat password diketik
                    onChanged: (String? value) {
                      setState(() {
                        _password2 = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _password2 = value!;
                        fieldText2.clear();
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
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
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              // simpen data
              _formKey.currentState!.save();
              // print(_pasien.toString());
              // print(_namaPenyakit.toString());
              // print(_pesanDokter.toString());
              // addPenyakit(_pasien, _namaPenyakit, _pesanDokter);
              final response = await request.login(
                  "https://web-production-0ada.up.railway.app/auth/dokter-signup/",
                  {
                    'username': _username,
                    'nomor_induk_kependudukan': _nik,
                    'nama_rumah_sakit': _asalRs,
                    'password1': _password1,
                    'password2': _password2,
                  });
              if (response["status"]) {
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
                                child: Text(
                                    "Sign Up berhasil. Tap OK to go to Log In page."),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DocLoginPage()),
                                  );
                                },
                                child: const Text('OK'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          shrinkWrap: true,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text("Sign Up gagal."),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Sign Up'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
