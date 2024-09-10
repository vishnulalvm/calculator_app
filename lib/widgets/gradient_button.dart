import 'package:calculator_app/constants/colors.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const GradientButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              APPColors.primary,
              Color.fromARGB(255, 27, 27, 27),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}