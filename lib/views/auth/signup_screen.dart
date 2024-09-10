import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/constants/styles.dart';
import 'package:calculator_app/views/auth/login_screen.dart';
import 'package:calculator_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: APPColors.primary,
      appBar: AppBar(
        title: const Text("Calculator App"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 20),
        child: Center(
          child: ClipPath(
            clipper: ClipClipper(),
            child: Container(
              width: 400,
              decoration: Styles.boxDecoration,
              child: Padding(
                padding: const EdgeInsets.only(top: 250, left: 40, right: 40),
                child: ListView(
                  children: [
                    const TextWidget(
                      text: "Let's Start",
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // const CustomTextField(hintText: "User Name or Email",),
                    const SizedBox(
                      height: 20,
                    ),
                    // const CustomTextField(hintText: "Password",),
                    const SizedBox(
                      height: 20,
                    ),
                    // const CustomTextField(hintText: "Repassword",),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      // child: GradientButton(name: "Sign Up",),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        children: [
                          const TextWidget(
                            text: "Already have an account? Sign in",
                            color: Colors.white,
                            size: 14,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    color: APPColors.primary,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


