import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sisehat_mobile/halaman_utama/all_pages/home_page.dart';
import 'package:sisehat_mobile/halaman_utama/all_pages/instance_login.dart';

class onboardingPage extends StatefulWidget {
  const onboardingPage({Key? key}) : super(key: key);

  @override
  State<onboardingPage> createState() => _onboardingPageState();
}

class _onboardingPageState extends State<onboardingPage> {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          color: Color.fromARGB(255, 77, 106, 109),
        ),
        bodyTextStyle: TextStyle(
          fontSize: 19,
          fontFamily: 'Poppins',
          color: Color.fromARGB(255, 77, 106, 109),
        ),
        bodyPadding: EdgeInsets.all(16));
    return IntroductionScreen(
      globalBackgroundColor: Color.fromARGB(1000, 234, 224, 204),
      pages: [
        PageViewModel(
            title: "SISEHAT",
            body:
                "Aplikasi Untuk membantu anda dalam tracking obat dan riwayat kesehatan.\nSISEHAT akan membantu anda dalam progress penyembuhan dengan track record yang terstruktur.",
            image: Image.asset(
              "lib/assets/doctoStarted.png",
              width: 450,
            ),
            decoration: pageDecoration),
        PageViewModel(
          title: "Fitur Menarik!",
          body:
              "Terdapat beragam fitur yang dapat anda gunakan untuk mempermudah anda dalam memanage aktivitas anda dalam progress penyembuhan Penyakit yang dialami.",
          image: Image.asset(
            "lib/assets/fiturStarted.png",
            width: 400,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
            title: "Layanan Cepat!",
            body:
                "Layanan yang sangat cepat dan bekerja sama dengan banyak mitra Rumah Sakit dan juga Dokter pilihan Anda.",
            image: Image.asset(
              "lib/assets/layananStarted.png",
              width: 350,
            ),
            decoration: pageDecoration,
            footer: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const instanceLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(1000, 77, 106, 109), // Background color
              ),
              child: const Text('Get Started',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            )),
      ],
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const instanceLogin()),
        );
        // Navigator.pushReplacement(context,
        //   MaterialPageRoute(builder: builder){
        //     return HomePage()
        //   }
        // )
      },
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: true,
      showBackButton: false,
      dotsFlex: 3,
      nextFlex: 1,
      skipOrBackFlex: 1,
      back: const Icon(
        Icons.arrow_back_ios,
        color: Color.fromARGB(1000, 77, 106, 109),
      ),
      skip: const Text(
        'Skip',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(1000, 77, 106, 109),
            fontSize: 19),
      ),
      next: const Icon(
        Icons.arrow_forward_ios,
        color: Color.fromARGB(1000, 77, 106, 109),
      ),
      done: const Text(
        'GO!',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(1000, 77, 106, 109),
            fontSize: 19),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10, 10),
        color: Colors.white,
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(25),
        )),
      ),
    );
  }
}
