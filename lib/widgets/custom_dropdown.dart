import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final void Function(String?)? onChanged;
  const CustomDropdownMenu({super.key, required this.onChanged});

  @override
  CustomDropdownMenuState createState() => CustomDropdownMenuState();
}

class CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String? selectedValue;
  final List<Map<String, String>> items = [
    {
      'value': 'not_very_active',
      'label': 'Not very Active',
      'description': 'Spend most of the day sitting'
    },
    {
      'value': 'lightly_active',
      'label': 'Lightly Active',
      'description': 'Spend a good Part of the day on your feet'
    },
    {
      'value': 'active',
      'label': 'Active',
      'description': 'Spend a good part of the day doing some physical activity'
    },
    {
      'value': 'very_active',
      'label': 'Very Active',
      'description':
          'Spend a good part of the day doing heavy physical activity'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        focusColor: Colors.white,
        value: selectedValue,
        hint: const Text('Select Activity level'),
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        underline: const SizedBox(),
        onChanged: widget.onChanged,
        items: items.map<DropdownMenuItem<String>>((Map<String, String> item) {
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
      ),
    );
  }
}
