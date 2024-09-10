import 'package:calculator_app/controllers/tdee_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(TDEEController());
  }
}