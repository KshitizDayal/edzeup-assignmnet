import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color bgcolor;
  final Color textColor;
  final String buttonText;
  const PrimaryButton(
      {super.key,
      required this.bgcolor,
      required this.textColor,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: bgcolor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: 200,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: bgcolor,
          backgroundColor: bgcolor,
          disabledForegroundColor: bgcolor,
          disabledBackgroundColor: bgcolor,
          shadowColor: bgcolor,
          surfaceTintColor: bgcolor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Border radius
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
