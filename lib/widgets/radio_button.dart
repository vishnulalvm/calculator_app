import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/controllers/tdee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderRadioButtons extends StatelessWidget {
  final TDEEController controller = Get.find();

  GenderRadioButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildRadioButton('Female'),
        const SizedBox(width: 20),
        _buildRadioButton('Male'),
      ],
    );
  }

  Widget _buildRadioButton(String gender) {
    return Obx(() => InkWell(
          onTap: () => controller.setGender(gender),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: controller.selectedGender.value == gender
                  ? APPColors.primary
                  : APPColors.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  controller.selectedGender.value == gender
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: controller.selectedGender.value == gender
                      ? Colors.black
                      : Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  gender,
                  style: TextStyle(
                    color: controller.selectedGender.value == gender
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
