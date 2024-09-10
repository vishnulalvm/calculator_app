import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/constants/styles.dart';
import 'package:calculator_app/models/user_model.dart';
import 'package:calculator_app/services/auth_sevice.dart';
import 'package:calculator_app/widgets/clipclipper_widget.dart';
import 'package:calculator_app/widgets/custom_textformfield.dart';
import 'package:calculator_app/widgets/gradient_button.dart';
import 'package:calculator_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  UserModel userModel = UserModel();
  AuthSevice authSevice = AuthSevice();

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
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const TextWidget(
                        text: "Let's Start",
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(height: 40),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "User Name or Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _repasswordController,
                        hintText: "Repassword",
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: GradientButton(
                          onPressed: _validateAndSubmit,
                          name: "Sign Up",
                        ),
                      ),
                      const SizedBox(height: 20),
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
      ),
    );
  }

  void _validateAndSubmit() async {
    if (_formKey.currentState!.validate()) {
      userModel = UserModel(
        email: _emailController.text,
        createdAt: DateTime.now(),
        password: _passwordController.text,
        status: 1,
      );
      final userData = await authSevice.registerUser(userModel);
      if (userData.user != null) {
        Get.offNamed('/');
      }
    }
  }
}
