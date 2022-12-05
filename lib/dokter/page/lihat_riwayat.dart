import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sisehat_mobile/dokter/models/penyakit.dart';
import 'package:sisehat_mobile/dokter/models/keluhan.dart';
import 'package:sisehat_mobile/dokter/page/form_penyakit.dart';

final primaryColor = Color(0xFFEAE0CC);
final secondaryColor = Color(0xFF798478);
final tertiaryColor = Color(0xFFA0A083);
final accentColor1 = Color(0xFF4D6A6D);
final accentColor2 = Color(0xFFC9ADA1);

void main() => runApp(LihatRiwayat());

class LihatRiwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lihat Riwayat',
      home: LihatRiwayatPage(),
    );
  }
}

class LihatRiwayatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LihatRiwayatPageState();
  }
}

class _LihatRiwayatPageState extends State<LihatRiwayatPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
  }

  static const List<Tab> _tabs = [
    Tab(text: 'Penyakit'),
    Tab(text: 'Keluhan'),
  ];

  Future<List<Penyakit>> fetchPenyakit() async {
    var url = Uri.parse('http://localhost:8000/dokter/penyakit/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Penyakit.
    List<Penyakit> listPenyakit = [];
    for (var d in data) {
      if (d != null) {
        listPenyakit.add(Penyakit.fromJson(d));
      }
    }
    return listPenyakit;
  }

  Future<List<Keluhan>> fetchKeluhan() async {
    var url = Uri.parse('http://localhost:8000/dokter/keluhan/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Keluhan.
    List<Keluhan> listKeluhan = [];
    for (var d in data) {
      if (d != null) {
        listKeluhan.add(Keluhan.fromJson(d));
      }
    }
    return listKeluhan;
  }

  late List<Widget> views = [
    Scaffold(
        body: FutureBuilder(
            future: fetchPenyakit(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Belum ada riwayat.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            elevation: 2,
                            shadowColor: Colors.black,
                            child: ListTile(
                              title: Text(
                                "${snapshot.data![index].fields.namaPenyakit}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              subtitle: Text(
                                  "Tanggal:\n${parseDate(snapshot.data![index].fields.tanggalDiagnosis)}"),
                              trailing: Text(
                                "NIK Pasien:\n${snapshot.data![index].fields.pasien}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          onTap: () async {
                            await showDialog(
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
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(children: <Widget>[
                                              Text(
                                                "Pesan dari Dokter:\n",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(snapshot.data![index].fields
                                                  .deskripsiKeluhan),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    50, 0, 50, 0),
                                                child: CheckboxListTile(
                                                    title:
                                                        const Text('Sembuh:'),
                                                    value: snapshot.data![index]
                                                        .fields.sembuh,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        // Set status di database;
                                                      });
                                                    }),
                                              )
                                            ]),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LihatRiwayat()),
                                                );
                                              },
                                              child: const Text('Kembali'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }));
                }
              }
            })),
    Scaffold(
        body: FutureBuilder(
            future: fetchKeluhan(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Belum ada riwayat.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            elevation: 2,
                            shadowColor: Colors.black,
                            child: ListTile(
                              title: Text(
                                "${snapshot.data![index].fields.tema}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              subtitle: Text(
                                  "Tanggal:\n${parseDate(snapshot.data![index].fields.tanggal)}"),
                              trailing: Text(
                                "NIK Pasien:\n${snapshot.data![index].fields.pasien}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          onTap: () async {
                            await showDialog(
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
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              children: <Widget>[
                                                const Text(
                                                  "Deskripsi Keluhan:\n",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(snapshot.data![index]
                                                    .fields.deskripsi),
                                              ],
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
                                });
                          }));
                }
              }
            })),
  ];

  String parseDate(DateTime dateIn) {
    var dateFormatter = DateFormat('dd-MM-yyyy');
    return dateFormatter.format(dateIn);
  }

  Widget parseStatus(bool status) {
    return CheckboxListTile(
        title: const Text('Sembuh:'),
        value: status,
        onChanged: (bool? value) {
          setState(() {
            status = value!;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: accentColor1,
        scaffoldBackgroundColor: primaryColor,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Halaman Utama'),
                  onTap: () {
                    // Route menu ke halaman utama
                    // Navigator.pop(
                    //   context,
                    // );
                  },
                ),
                // Menambahkan clickable menu
                ListTile(
                  title: const Text('Logout'),
                  onTap: () {
                    // Route menu ke halaman utama sekalian logout
                    // Navigator.pop(
                    //   context,
                    // );
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontStyle: FontStyle.italic),
              overlayColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return secondaryColor;
                }
                if (states.contains(MaterialState.focused)) {
                  return secondaryColor;
                } else if (states.contains(MaterialState.hovered)) {
                  return primaryColor;
                }

                return Colors.transparent;
              }),
              indicatorWeight: 10,
              indicatorColor: secondaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.all(5),
              indicator: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(1),
                color: secondaryColor,
              ),
              isScrollable: true,
              physics: BouncingScrollPhysics(),
              onTap: (int index) {
                print('Tab $index is tapped');
              },
              enableFeedback: true,
              // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
              // controller: _tabController,
              tabs: _tabs,
            ),
            title: const Text('SiSehat'),
            backgroundColor: accentColor1,
          ),
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            // controller: _tabController,
            children: views,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: false,
                  child: FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Placeholder',
                    child: const Text("Input Penyakit"),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 120,
                  child: FloatingActionButton(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    onPressed: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPenyakitPage()),
                      );
                    },
                    tooltip: 'Tambah Penyakit',
                    backgroundColor: accentColor1,
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text("Input Penyakit"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
