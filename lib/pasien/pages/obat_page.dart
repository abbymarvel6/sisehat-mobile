import '../utils/colors.dart';
import '../utils/text_styles.dart';
import '../utils/interface_helpers.dart';
import '../widgets/common_tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ObatPage extends StatefulWidget {
  @override
  _ObatPageState createState() => _ObatPageState();
}

class _ObatPageState extends State<ObatPage> {
  List<String> itemTitles = [
    'What is this app about?',
    'Credits',
  ];

  List<String> itemContent = [
    'Dashboard Reborn is a showcase of beautiful UI elements written purely in Dart code.\n\nThe entire project is open source, and you can use the code however you want in your own apps.\n\nThat said, if you liked this app or found it helpful, please fork/star it on GitHub and give me a shoutout. Pull requests are more than welcome too.\n\nThanks!',
    'This app would not have been possible without the Flutter framework, the open source projects that I\'ve used and the tireless efforts of developers and contributors in the Flutter community. \n\nPlease see the README.md file in the repository below for more details.',
  ];

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
              child: ListView(
                children: List.generate(itemTitles.length, (index) {
                  return CommonTile(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            itemTitles[index],
                            style: HeadingStylesDefault.accent,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            itemContent[index],
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
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
