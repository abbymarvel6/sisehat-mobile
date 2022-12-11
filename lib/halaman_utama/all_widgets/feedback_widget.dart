import 'package:flutter/material.dart';

class feedback_widget extends StatelessWidget {
  final String image;
  final String judul;
  final String keterangan;
  const feedback_widget({
    Key? key,
    required this.image,
    required this.judul,
    required this.keterangan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 360,
        decoration: BoxDecoration(
            color: const Color.fromARGB(65, 28, 27, 24),
            borderRadius: BorderRadius.circular(15.0)),
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "$judul",
              overflow: TextOverflow.fade,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromARGB(255, 72, 65, 65),
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              keterangan,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color.fromARGB(255, 72, 65, 65)),
            )
          ],
        ),
      ),
    );
  }
}
