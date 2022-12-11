import '../utils/colors.dart';
import '../utils/fetch_penyakit.dart';
import '../utils/text_styles.dart';
import '../utils/interface_helpers.dart';
import '../widgets/common_tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class PenyakitPage extends StatefulWidget {
  @override
  _PenyakitPageState createState() => _PenyakitPageState();
}

class _PenyakitPageState extends State<PenyakitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: extraInvertColorsStrong(context),
      body: Container(
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
                    icon: Icon(EvaIcons.arrowIosBack),
                    tooltip: 'Go back',
                    color: invertColorsStrong(context),
                    iconSize: 26.0,
                    onPressed: () {
                      Navigator.pop(context);
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
            Expanded(
                child: FutureBuilder(
                    future: fetchPenyakit(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (snapshot.data.isEmpty) {
                          return Column(
                            children: const [
                              Text(
                                "riwayat penyakit masih kosong",
                                style: TextStyle(
                                    color: Color(0xff59A5D8), fontSize: 32),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        } else {
                          return ListView(
                            children: List.generate(1, (index) {
                              return CommonTile(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[index].diagnosis +
                                            " -- " +
                                            snapshot.data[index].pasien +
                                            "(pasien)",
                                        style: HeadingStylesDefault.accent,
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Text(
                                        snapshot.data[index].tanggal,
                                        style: isThemeCurrentlyDark(context)
                                            ? BodyStylesDefault.white
                                            : BodyStylesDefault.black,
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                      Text(
                                        snapshot.data[index].deskripsi,
                                        style: isThemeCurrentlyDark(context)
                                            ? BodyStylesDefault.white
                                            : BodyStylesDefault.black,
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                      Text(
                                        "Dokter " +
                                            snapshot.data[index].dokter +
                                            "(dokter)",
                                        style: isThemeCurrentlyDark(context)
                                            ? BodyStylesDefault.white
                                            : BodyStylesDefault.black,
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                ),
                                splashColor: MyColors.accent,
                                onTap: () {},
                              );
                            }),
                          );
                        }
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
