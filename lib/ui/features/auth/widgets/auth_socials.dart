import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class AuthSocials extends StatelessWidget {
  const AuthSocials({
    super.key,
    this.isLogin = false,
  });

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                height: 10,
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(width: 30),
            Text('Or ${isLogin ? 'Sign Up' : 'Login'} With'),
            const SizedBox(width: 30),
            Expanded(
              child: Divider(
                height: 10,
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
        SizedBox(height: Layout.setHeight(context, 3)),
        Row(
          children: [
            Expanded(
              child: SocialButton(
                onPressed: () {},
                logo: Assets.google,
              ),
            ),
            SizedBox(width: Layout.setWidth(context, 5)),
            Expanded(
              child: SocialButton(
                onPressed: () {},
                logo: Assets.microsoft,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.onPressed,
    required this.logo,
  });

  final VoidCallback onPressed;
  final String logo;

  String getSocial(String social) {
    switch (logo) {
      case Assets.google:
        return 'Google';
      case Assets.microsoft:
        return 'Microsoft';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 15,
        ),
        elevation: 0,
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            logo,
            width: 20,
          ),
          const SizedBox(width: 10),
          Text(
            getSocial(logo),
            style: const TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
