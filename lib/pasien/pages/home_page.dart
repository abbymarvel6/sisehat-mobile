import 'package:sisehat_mobile/main.dart' as parent;
import 'package:sisehat_mobile/pasien/widgets/daftar_keluhan.dart';

import 'package:sisehat_mobile/halaman_utama/all_pages/home_page.dart' as home;

import '../../halaman_utama/all_pages/instance_login.dart';
import 'penyakit_page.dart';
import 'keluhan_page.dart';
import '../utils/colors.dart';
import '../utils/text_styles.dart';
import '../utils/interface_helpers.dart';
import '../widgets/common_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

//this page is based on https://github.com/Ivaskuu/dashboard

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    List<String> itemNames = [
      'mengeluh',
      'penyakit',
      'keluhan',
    ]; //name of each individual tile

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
                    icon: Icon(Icons.backspace_rounded),
                    tooltip: 'Go back',
                    color: invertColorsStrong(context),
                    iconSize: 26.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            return home.HomePage(
                              title: "Pasien",
                            );
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.logout),
                    tooltip: 'Logout',
                    color: invertColorsStrong(context),
                    iconSize: 26.0,
                    onPressed: () async {
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
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 2.5,
                children: List.generate(
                  itemNames.length,
                  (index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15.0),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Hero(
                                    tag: 'title$index',
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        '${itemNames[index]}',
                                        style: isThemeCurrentlyDark(context)
                                            ? LabelStyles.white
                                            : LabelStyles.black,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              splashColor: MyColors.accent,
                              borderRadius: BorderRadius.circular(15.0),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) {
                                      if (index == 0) {
                                        return MengeluhPage();
                                      } else if (index == 1) {
                                        return PenyakitPage();
                                      } else {
                                        return KeluhanPage();
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
