import 'package:gromuse/commons/utils/kcolors.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const CustomHeader({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: onButtonPressed,
            style: TextButton.styleFrom(
              backgroundColor: Kolors.kPrimaryLight,
               // Customize the button text color
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
