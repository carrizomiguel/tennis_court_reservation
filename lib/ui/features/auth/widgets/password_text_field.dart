import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool show = false;

  void toggle() {
    setState(() => show = !show);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      controller: widget.controller,
      label: 'Password',
      obscureText: !show,
      suffix: GestureDetector(
        onTap: toggle,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            show ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
