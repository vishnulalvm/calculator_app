import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/constants/styles.dart';
import 'package:calculator_app/views/auth/login_screen.dart';
import 'package:calculator_app/widgets/custom_dropdown.dart';
import 'package:calculator_app/widgets/custom_textformfield.dart';
import 'package:calculator_app/widgets/gradient_button.dart';
import 'package:calculator_app/widgets/radio_button.dart';
import 'package:calculator_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _feetController = TextEditingController();
  final _inchController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  String _selectedGender = 'Female';
  String? _selectedActivityLevel;

  @override
  void dispose() {
    _feetController.dispose();
    _inchController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  String _tdeeResult = '';

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
              height: double.infinity,
              decoration: Styles.boxDecoration,
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(
                          child: TextWidget(
                            text: "Calculate Your TDEE",
                            color: Colors.white,
                            size: 18,
                            fw: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 140),
                        CustomDropdownMenu(
                          onChanged: (String? value) {
                            setState(() {
                              _selectedActivityLevel = value;
                            });
                          },
                        ),
                        const SizedBox(height: 40),
                        GenderRadioButtons(
                          onChanged: (String selectedGender) {
                            setState(() {
                              _selectedGender = selectedGender;
                            });
                          },
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: "Feet",
                                controller: _feetController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter feet';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: CustomTextField(
                                hintText: "Inch",
                                controller: _inchController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter inches';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        CustomTextField(
                          hintText: "Weight",
                          controller: _weightController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter weight';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          hintText: "Age",
                          controller: _ageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter age';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: GradientButton(
                            name: "Calculate TDEE",
                            onPressed: _calculateTDEE,
                          ),
                        ),
                        const SizedBox(height: 40),
                        const TextWidget(
                          text: "The estimated TDEE",
                          color: Colors.white,
                          size: 12,
                        ),
                         TextWidget(
                          text: _tdeeResult,
                          color: APPColors.primary,
                          size: 14,
                          fw: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _calculateTDEE() {
    if (_formKey.currentState!.validate()) {
      double heightInCm = (double.parse(_feetController.text) * 30.48) +
          (double.parse(_inchController.text) * 2.54);
      double weightInKg = double.parse(_weightController.text); // Assuming weight is in lbs
      int age = int.parse(_ageController.text);

      // Calculate BMR
      double bmr;
      if (_selectedGender == 'Male') {
        bmr = 88.362 +
            (13.397 * weightInKg) +
            (4.799 * heightInCm) -
            (5.677 * age);
      } else {
        bmr = 447.593 +
            (9.247 * weightInKg) +
            (3.098 * heightInCm) -
            (4.330 * age);
      }

      // Activity factor
      double activityFactor;
      switch (_selectedActivityLevel) {
        case 'Sedentary':
          activityFactor = 1.2;
          break;
        case 'Lightly Active':
          activityFactor = 1.375;
          break;
        case 'Moderately Active':
          activityFactor = 1.55;
          break;
        case 'Very Active':
          activityFactor = 1.725;
          break;
        case 'Extra Active':
          activityFactor = 1.9;
          break;
        default:
          activityFactor = 1.2; // Default to sedentary if not selected
      }

      // Calculate TDEE
      double tdee = bmr * activityFactor;

      setState(() {
        _tdeeResult = '${tdee.round()} Calories/day';
      });

    }
  }
}
