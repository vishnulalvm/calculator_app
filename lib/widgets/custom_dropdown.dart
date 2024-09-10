import 'package:calculator_app/controllers/tdee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownMenu extends StatelessWidget {
  final TDEEController controller = Get.find();

  CustomDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Obx(() => DropdownButton<String>(
            focusColor: Colors.white,
            value: controller.selectedActivityLevel.value,
            hint: const Text('Select Activity level'),
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            underline: const SizedBox(),
            onChanged: controller.setActivityLevel,
            items: controller.activityLevels
                .map<DropdownMenuItem<String>>((Map<String, String> item) {
              return DropdownMenuItem<String>(
                value: item['value'],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['label']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['description']!,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600],
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              );
            }).toList(),
          )),
    );
  }
}
