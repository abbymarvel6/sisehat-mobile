import 'pages/note_page.dart';
import 'utils/colors.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(EasyDynamicThemeWidget(child: Pasien()));

class Pasien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primaryColor: MyColors.primary,
        accentColor: MyColors.accent,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Quicksand',
        primaryColor: MyColors.primary,
        accentColor: MyColors.accent,
        brightness: Brightness.dark,
      ),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: NotePage(),
    );
  }
}
