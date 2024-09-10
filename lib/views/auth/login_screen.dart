import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/models/user_model.dart';
import 'package:calculator_app/services/auth_sevice.dart';
import 'package:calculator_app/widgets/clipclipper_widget.dart';
import 'package:calculator_app/widgets/custom_textformfield.dart';
import 'package:calculator_app/widgets/gradient_button.dart';
import 'package:calculator_app/widgets/otp_button.dart';
import 'package:calculator_app/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();
  AuthSevice authSevice = AuthSevice();
  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        userModel = UserModel(
          email: _emailController.text,
          password: _passwordController.text,
        );
        final data = await authSevice.loginUser(userModel);
        if (data != null) {
          Get.offNamed('/');
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$e")));
      }
    }
  }

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
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const Center(
                        child: TextWidget(
                          text: "Glad You're here",
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          "assets/images/login.png",
                          width: 40,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "User Name or Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!GetUtils.isEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: GradientButton(
                          onPressed: _handleLogin,
                          name: "Login",
                        ),
                      ),
                      const SizedBox(height: 20),
                      OtpWhiteButton(
                        onTap: () {
                          Get.toNamed('/otp');
                        },
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextWidget(
                              text: "Don't have an account?",
                              color: Colors.white,
                              size: 14,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/signup');
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: APPColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
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
      ),
    );
  }
}
