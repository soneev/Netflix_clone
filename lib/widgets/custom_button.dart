import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonwidget extends StatelessWidget {
  const CustomButtonwidget({
    Key? key,
    required this.icon,
    required this.titile,
    this.textsize = 18,
    this.iconsize = 30,
  }) : super(key: key);
  final IconData icon;
  final String titile;
  final double iconsize;
  final double textsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhitecolor,
          size: iconsize,
        ),
        Text(
          titile,
          style: TextStyle(
            fontSize: textsize,
          ),
        ),
      ],
    );
  }
}
