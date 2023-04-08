import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class DefaultCheckbox extends StatelessWidget {
  const DefaultCheckbox({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (active) {},
          activeColor: kAccentColor,
          side: BorderSide(
            color: Colors.grey.shade400,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        Text(label)
      ],
    );
  }
}
