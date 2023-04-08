import 'package:flutter/material.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({
    super.key,
    this.leadingIcon,
    this.trailingIcon,
    required this.actionString,
  });

  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String actionString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              if (leadingIcon != null) ...[
                Icon(
                  leadingIcon,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
              Text(
                actionString,
                style: const TextStyle(fontSize: 17),
              ),
              if (trailingIcon != null) ...[
                const Spacer(),
                Icon(
                  trailingIcon,
                  color: Colors.black,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
