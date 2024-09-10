import 'package:calculator_app/constants/colors.dart';
import 'package:flutter/material.dart';

class GenderRadioButtons extends StatefulWidget {
  final Function(String) onChanged;

  const GenderRadioButtons({super.key, required this.onChanged});

  @override
  GenderRadioButtonsState createState() => GenderRadioButtonsState();
}

class GenderRadioButtonsState extends State<GenderRadioButtons> {
  String _selectedGender = 'Female';

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
    return InkWell(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
        widget.onChanged(_selectedGender);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _selectedGender == gender ? APPColors.primary : APPColors.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _selectedGender == gender ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: _selectedGender == gender ? Colors.black : Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              gender,
              style: TextStyle(
                color: _selectedGender == gender ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}