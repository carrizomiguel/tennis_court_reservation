import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 55,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade400,
          child: Icon(
            Icons.person,
            color: Colors.grey.shade600,
            size: 40,
          ),
        ),
      ),
    );
  }
}
