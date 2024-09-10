import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/constants/styles.dart';
import 'package:calculator_app/controllers/tdee_controller.dart';
import 'package:calculator_app/views/auth/login_screen.dart';
import 'package:calculator_app/widgets/custom_dropdown.dart';
import 'package:calculator_app/widgets/custom_textformfield.dart';
import 'package:calculator_app/widgets/gradient_button.dart';
import 'package:calculator_app/widgets/radio_button.dart';
import 'package:calculator_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final TDEEController controller = Get.put(TDEEController());

  HomeScreen({super.key});

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
                          // onChanged: controller.setActivityLevel,
                        ),
                        const SizedBox(height: 40),
                        GenderRadioButtons(
                          // onChanged: controller.setGender,
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: "Feet",
                                controller: controller.feetController,
                                validator: (value) => value?.isEmpty ?? true
                                    ? 'Please enter feet'
                                    : null,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: CustomTextField(
                                hintText: "Inch",
                                controller: controller.inchController,
                                validator: (value) => value?.isEmpty ?? true
                                    ? 'Please enter inches'
                                    : null,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        CustomTextField(
                          hintText: "Weight",
                          controller: controller.weightController,
                          validator: (value) => value?.isEmpty ?? true
                              ? 'Please enter weight'
                              : null,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          hintText: "Age",
                          controller: controller.ageController,
                          validator: (value) => value?.isEmpty ?? true
                              ? 'Please enter age'
                              : null,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: GradientButton(
                            name: "Calculate TDEE",
                            onPressed: controller.calculateTDEE,
                          ),
                        ),
                        const SizedBox(height: 40),
                        const TextWidget(
                          text: "The estimated TDEE",
                          color: Colors.white,
                          size: 12,
                        ),
                        Obx(() => TextWidget(
                              text: controller.tdeeResult.value,
                              color: APPColors.primary,
                              size: 14,
                              fw: FontWeight.bold,
                            )),
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
}
