import 'package:flutter/material.dart';
// import 'package:sisehatpbp/all_pages/home_page.dart';
// import 'package:sisehatpbp/all_pages/onboarding.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sisehat_mobile/halaman_utama/all_pages/home_page.dart';
import 'package:sisehat_mobile/halaman_utama/all_pages/instance_login.dart';
import 'package:sisehat_mobile/halaman_utama/all_pages/onboarding.dart';

int introduction = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  await initIntroductions();
  runApp(const MyApp());
}

Future initIntroductions() async {
  final prefs = await SharedPreferences.getInstance();

  int? intro = prefs.getInt('introduction');
  print('intro : $intro');
  if (intro != null && intro == 1) {
    return introduction = 1;
  }
  prefs.setInt('introduction', 1);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: introduction == 1 ? onboardingPage() : instanceLogin(),
        ));
  }
}
