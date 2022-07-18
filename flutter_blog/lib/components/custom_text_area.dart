import 'package:flutter/material.dart';

class CustomTextFormArea extends StatelessWidget {
  final String hint;
  final funValidator;
  final String? value;

  const CustomTextFormArea(
      {super.key, required this.hint, required this.funValidator, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLines: 10,
        initialValue: value ?? "",
        validator: funValidator,
        decoration: InputDecoration(
          hintText: "Enter $hint",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
