import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/auth/auth.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const ProfileAvatar(),
            const SizedBox(height: 20),
            const Text(
              'Guest',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 40),
            const ProfileActionButton(
              leadingIcon: Icons.edit,
              actionString: 'Edit profile',
              trailingIcon: Icons.arrow_forward_ios_rounded,
            ),
            const ProfileActionButton(
              leadingIcon: Icons.settings,
              actionString: 'Settings',
              trailingIcon: Icons.arrow_forward_ios_rounded,
            ),
            const ProfileActionButton(
              leadingIcon: Icons.notifications,
              actionString: 'Notifications',
              trailingIcon: Icons.arrow_forward_ios_rounded,
            ),
            InkWell(
              onTap: () => context.go('/signin'),
              child: const ProfileActionButton(
                leadingIcon: Icons.logout,
                actionString: 'Sign Out',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
