import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/features/auth/auth.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  static Page<dynamic> page() {
    return const MaterialPage<void>(
      child: AccountPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AccountBody();
  }
}

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountView();
  }
}
