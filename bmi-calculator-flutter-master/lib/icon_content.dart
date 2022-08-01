import 'package:flutter/material.dart';

const double boxHeight = 15.0;
const double iconSize = 80;
const TextStyle textStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconContent({
    this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(height: boxHeight),
        Text(
          text,
          style: textStyle,
        )
      ],
    );
  }
}
