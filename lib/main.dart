import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/firebase_options.dart';
import 'package:calculator_app/views/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HungrX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: APPColors.secondary,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      getPages: [

        GetPage(
          

          name: '/', // Home route
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/details', // Details route (example)
          page: () => DetailsScreen(), // Replace with your actual widget
        ),
      ],
      home: HomeScreen(),
    );
  }
}
