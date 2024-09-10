import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/views/auth/login_screen.dart';
import 'package:calculator_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class OtpSignupScreen extends StatefulWidget {
  const OtpSignupScreen({super.key});

  @override
  State<OtpSignupScreen> createState() => _OtpSignupScreenState();
}

class _OtpSignupScreenState extends State<OtpSignupScreen> {
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
                padding: const EdgeInsets.only(top: 150, left: 40, right: 40),
                child: ListView(
                  children: [
                    const TextWidget(
                      text: "For SignIn With Mobile OTP",
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // const CustomTextField(hintText: "Mobile Number",),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      // child: GradientButton(name: "Submit",),
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


