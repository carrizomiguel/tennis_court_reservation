import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.suffix,
  });

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: 'Type here...',
            hintStyle: TextStyle(color: Colors.grey.shade300),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            suffixIcon: suffix,
            enabledBorder: _inputBorder(),
            focusedBorder: _inputBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      ),
    );
  }
}
