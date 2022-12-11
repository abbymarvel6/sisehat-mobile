import 'package:flutter/material.dart';

class fitur_widget extends StatelessWidget {
  final String imagePath;
  final String imageName;
  const fitur_widget({
    Key? key,
    required this.imagePath,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(65, 28, 27, 24),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 32,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            imageName,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
