import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/widgets/custom_textformfield.dart';
import 'package:calculator_app/widgets/gradient_button.dart';
import 'package:calculator_app/widgets/otp_button.dart';
import 'package:calculator_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
              decoration: const BoxDecoration(
                color: APPColors.secondary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    topLeft: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 80, left: 40, right: 40),
                child: ListView(
                  children: [
                    const Center(
                      child: TextWidget(
                        text: "Glad Your here",
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          "assets/images/login.png",
                          width: 40,
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                      controller: _emailController,
                      hintText: "User Name or Email",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: "Password",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: GradientButton(
                        onPressed: () {
                          
                        },
                        name: "Login",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const OtpWhiteButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        children: [
                          const TextWidget(
                            text: "Don't have an account? Sign up",
                            color: Colors.white,
                            size: 14,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign Up",
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
