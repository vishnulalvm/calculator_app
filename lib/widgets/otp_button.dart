import 'package:flutter/material.dart';

class OtpWhiteButton extends StatelessWidget {
  const OtpWhiteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        width: 305, // Button width
        height: 50, // Button height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5), // Rounded corners
        ),
        child: const Center(
          child: Text(
            'Sign in with Mobile Number',
            style: TextStyle(
              color: Colors.black, // Text color
              fontSize: 14, // Text size
            ),
          ),
        ),
      ),
    );
  }
}
