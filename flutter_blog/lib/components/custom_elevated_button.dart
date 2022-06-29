import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  const CustomElevatedButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: () {},
      child: Text(text),
    );
  }
}
