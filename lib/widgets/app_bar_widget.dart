import 'package:flutter/material.dart';

import 'package:netflix/core/colors/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.titile}) : super(key: key);
  final String titile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        width,
        Text(
          titile,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        width,
        Container(color: Colors.blue, height: 30, width: 30),
        width
      ],
    );
  }
}
