import 'package:flutter/material.dart';

class ClipClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Move to the top-left corner
    path.moveTo(0, 0);

    // Draw the top edge
    path.lineTo(size.width, 50);

    // Draw the right edge
    path.lineTo(size.height, size.height);

    // Draw the bottom edge
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}