import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/views/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HungrX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, // Transparent AppBar
          elevation: 0, // Remove shadow (optional)
          centerTitle: true, // Center the AppBar title
          titleTextStyle: TextStyle(
            color: APPColors.secondary, // Title color is black
            fontSize: 20,
            fontFamily: 'Poppins', // Title size is 16
            fontWeight: FontWeight.bold,

            // Optional: Bold title
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
