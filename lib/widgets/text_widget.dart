import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final TextAlign? alignment;
  final String? text;
  final Color? color;
  final double? size;
  final FontWeight? fw;
  const TextWidget(
      {super.key,
     
      this.size,
      this.text,
      this.color,
      this.fw,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fw,
          fontFamily: 'Poppins'),
    );
  }
}
