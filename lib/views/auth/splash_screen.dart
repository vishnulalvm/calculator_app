import 'package:calculator_app/constants/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: APPColors.primary,
          
    
        ),
        child: const Center(
          child: Text("HungrX",style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: APPColors.secondary,
          ),),
        ),
      ),
    );
  }
}