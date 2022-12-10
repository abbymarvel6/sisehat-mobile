import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:http/http.dart' as http;

import 'package:sisehat_mobile/dokter/page/form_penyakit.dart';
import 'package:sisehat_mobile/dokter/utils/drawer.dart';
import 'package:sisehat_mobile/registrasi/logindokter.dart';
import '../utils/fetchKeluhan.dart';
import '../utils/fetchPenyakit.dart';

final primaryColor = Color(0xFFEAE0CC);
final secondaryColor = Color(0xFF798478);
final tertiaryColor = Color(0xFFA0A083);
final accentColor1 = Color(0xFF4D6A6D);
final accentColor2 = Color(0xFFC9ADA1);

void main() => runApp(const LihatRiwayat());

class LihatRiwayat extends StatelessWidget {
  const LihatRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: 'Lihat Riwayat',
          home: LihatRiwayatPage(username: ""),
          routes: {
            "/login": (BuildContext context) => const DocLoginPage(),
          },
        ));
  }
}

class LihatRiwayatPage extends StatefulWidget {
  LihatRiwayatPage({
    super.key,
    required this.username,
  });

  late String username;

  @override
  State<StatefulWidget> createState() {
    return _LihatRiwayatPageState(username: username);
  }
}

class _LihatRiwayatPageState extends State<LihatRiwayatPage>
    with TickerProviderStateMixin {
  _LihatRiwayatPageState({required this.username});

  late String username;

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

  bool statusUpdate = false;

  String parseDate(DateTime dateIn) {
    var dateFormatter = DateFormat('dd-MM-yyyy');
    return dateFormatter.format(dateIn);
  }

  bool parseStatus(bool status) {
    if (status) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    print("L_R LOGGEDIN? ${request.loggedIn}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: accentColor1,
        scaffoldBackgroundColor: primaryColor,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: const RiwayatPageDrawer(),
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
          body: TabBarView(physics: const BouncingScrollPhysics(),
              // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
              // controller: _tabController,
              children: <Widget>[
                Scaffold(
                    body: FutureBuilder(
                        future: fetchPenyakit(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            if (!snapshot.hasData) {
                              return Column(
                                children: const [
                                  Text(
                                    "Belum ada riwayat.",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 15,
                                                child: StatefulBuilder(builder:
                                                    (BuildContext context,
                                                        StateSetter setState) {
                                                  return Container(
                                                    child: ListView(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20,
                                                              bottom: 20),
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Column(
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  "Pesan dari Dokter:\n",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(snapshot
                                                                        .data![
                                                                            index]
                                                                        .fields
                                                                        .deskripsiKeluhan +
                                                                    "\n"),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          50,
                                                                          0,
                                                                          50,
                                                                          0),
                                                                  child: CheckboxListTile(
                                                                      title: const Text('Sembuh:'),
                                                                      value: snapshot.data![index].fields.sembuh,
                                                                      onChanged: (bool? value) {
                                                                        http.get(
                                                                            Uri.parse('https://web-production-0ada.up.railway.app/dokter/toggle-mobile/${snapshot.data![index].pk}'));
                                                                        setState(
                                                                            () {
                                                                          snapshot
                                                                              .data![index]
                                                                              .fields
                                                                              .sembuh = value!;
                                                                        });
                                                                      }),
                                                                )
                                                              ]),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: TextButton(
                                                            onPressed: () {
                                                              Navigator
                                                                  .pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            LihatRiwayatPage(
                                                                              username: username,
                                                                            )),
                                                              );
                                                            },
                                                            child: const Text(
                                                                'Kembali'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
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
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            if (!snapshot.hasData) {
                              return Column(
                                children: const [
                                  Text(
                                    "Belum ada riwayat.",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 15,
                                                child: Container(
                                                  child: ListView(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20,
                                                            bottom: 20),
                                                    shrinkWrap: true,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Column(
                                                          children: <Widget>[
                                                            const Text(
                                                              "Deskripsi Keluhan:\n",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(snapshot
                                                                    .data![
                                                                        index]
                                                                    .fields
                                                                    .deskripsi +
                                                                "\n"),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'Kembali'),
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
              ]),
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
                            builder: (context) => AddPenyakitPage(
                                  username: username,
                                )),
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
