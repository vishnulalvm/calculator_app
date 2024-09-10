import 'package:calculator_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkStatusLogin();
  }

  Future<void> checkStatusLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offNamed('/');
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offNamed('/login');
      });
    }
  }

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
          child: Text(
            "HungrX",
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: APPColors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
