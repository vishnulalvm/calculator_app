import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TDEEController extends GetxController {
  final feetController = TextEditingController();
  final inchController = TextEditingController();
  final weightController = TextEditingController();
  final ageController = TextEditingController();

  final selectedGender = 'Female'.obs;
  final selectedActivityLevel = Rx<String?>(null);
  final tdeeResult = ''.obs;

  final List<Map<String, String>> activityLevels = [
    {
      'value': 'sedentary',
      'label': 'Sedentary',
      'description': 'Little to no exercise'
    },
    {
      'value': 'lightly_active',
      'label': 'Lightly Active',
      'description': 'Light exercise 1-3 days/week'
    },
    {
      'value': 'moderately_active',
      'label': 'Moderately Active',
      'description': 'Moderate exercise 3-5 days/week'
    },
    {
      'value': 'very_active',
      'label': 'Very Active',
      'description': 'Hard exercise 6-7 days/week'
    },
    {
      'value': 'extra_active',
      'label': 'Extra Active',
      'description': 'Very hard exercise & physical job or 2x training'
    },
  ];

  void setGender(String gender) {
    selectedGender.value = gender;
    calculateTDEE(); // Recalculate TDEE when gender changes
  }

  void setActivityLevel(String? level) {
    selectedActivityLevel.value = level;
    calculateTDEE(); // Recalculate TDEE when activity level changes
  }

  void calculateTDEE() {
    if (isFormValid()) {
      double heightInCm = (double.parse(feetController.text) * 30.48) +
          (double.parse(inchController.text) * 2.54);
      double weightInKg = double.parse(weightController.text);
      int age = int.parse(ageController.text);

      double bmr;
      if (selectedGender.value == 'Male') {
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

      double activityFactor = getActivityFactor(selectedActivityLevel.value);
      double tdee = bmr * activityFactor;
      tdeeResult.value = '${tdee.round()} Calories/day';
    } else {
      tdeeResult.value = 'Please fill all fields';
    }
  }

  double getActivityFactor(String? activityLevel) {
    switch (activityLevel) {
      case 'sedentary':
        return 1.2;
      case 'lightly_active':
        return 1.375;
      case 'moderately_active':
        return 1.55;
      case 'very_active':
        return 1.725;
      case 'extra_active':
        return 1.9;
      default:
        return 1.2; // Default to sedentary if no valid selection
    }
  }

  bool isFormValid() {
    return feetController.text.isNotEmpty &&
        inchController.text.isNotEmpty &&
        weightController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        selectedActivityLevel.value != null;
  }

  @override
  void onClose() {
    feetController.dispose();
    inchController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.onClose();
  }
}
