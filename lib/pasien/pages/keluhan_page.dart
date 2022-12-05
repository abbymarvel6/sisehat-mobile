import 'dart:ui';

import '../utils/colors.dart';
import '../utils/text_styles.dart';
import '../utils/interface_helpers.dart';
import '../widgets/daftar_keluhan.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class KeluhanPage extends StatefulWidget {
  @override
  _KeluhanPageState createState() => _KeluhanPageState();
}

class _KeluhanPageState extends State<KeluhanPage> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 132, 132, 132),
      body: WillPopScope(
        onWillPop: this.handleBackPressed,
        child: Container(
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          iconSize: 26.0,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Hero(
                          tag: 'title0',
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              'kembali',
                              style: isThemeCurrentlyDark(context)
                                  ? TitleStylesDefault.white
                                  : TitleStylesDefault.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Hero(
                        tag: 'tile0',
                        child: Container(
                          height: _height / 1.4,
                          width: _width / 1.2,
                          margin: EdgeInsets.all(20.0),
                          child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(10.0),
                              shadowColor: shadowColor(context),
                              child: null),
                        ),
                      ),
                      Positioned(
                        bottom: 100.0,
                        left: 40.0,
                        child: Text(
                          'Hello, world!',
                          style: isThemeCurrentlyDark(context)
                              ? SubHeadingStylesMaterial.light
                              : SubHeadingStylesMaterial.dark,
                        ),
                      ),
                      Positioned(
                        bottom: 60.0,
                        left: 40.0,
                        child: Hero(
                          tag: 'elt1',
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              'Click me.',
                              style: isThemeCurrentlyDark(context)
                                  ? HeadingStylesMaterial.light
                                  : HeadingStylesMaterial.dark,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40.0,
                        right: 40.0,
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          child: FloatingActionButton(
                            heroTag: 'elt2',
                            foregroundColor: MyColors.light,
                            backgroundColor: MyColors.accent,
                            elevation: 3.0,
                            child: const Icon(EvaIcons.plus),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DaftarKeluhan(), //the awesome sliding up bottom sheet
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> handleBackPressed() {
    if (isBottomSheetOpen) {
      toggleBottomSheet();
      return Future.value(false);
    }
    return Future.value(true);
  }
}
