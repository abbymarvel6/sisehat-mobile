import '../pages/home_page.dart';
import '../utils/colors.dart';
import '../utils/text_styles.dart';
import '../utils/interface_helpers.dart';
import '../widgets/common_tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<String> itemContent = [
    'Note: this app does nothing.',
    'Yep, you read that right! It\'s only meant to serve as a UI template for Flutter developers to use in their own apps.\n\nThe entire source code is freely available on GitHub, so you can tweak it and use it as per your liking.\n\nEnjoy, and don\'t forget to star the project on GitHub. It really helps me out!\n\n- Urmil Shroff',
  ]; //the text in the tile

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
                top: 60.0,
                bottom: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome!',
                    style: isThemeCurrentlyDark(context)
                        ? TitleStylesDefault.white
                        : TitleStylesDefault.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Hero(
                    tag: 'tile2',
                    child: CommonTile(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              itemContent[0],
                              style: HeadingStylesDefault.accent,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              itemContent[1],
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        child: Icon(
          EvaIcons.checkmark,
          size: 30.0,
        ),
        tooltip: 'Accept',
        foregroundColor: extraInvertColorsStrong(context),
        backgroundColor: extraInvertColorsTheme(context),
        elevation: 5.0,
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
    );
  }
}
