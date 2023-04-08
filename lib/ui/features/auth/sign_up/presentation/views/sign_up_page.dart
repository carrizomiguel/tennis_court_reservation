import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Page<dynamic> page() {
    return const MaterialPage<void>(
      child: SignUpPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SignUpBody();
  }
}

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
