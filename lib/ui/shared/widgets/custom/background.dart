import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
    required this.backgroundColor,
    this.heightPercent = 40,
    required this.child,
  });

  final Color backgroundColor;
  final double heightPercent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: Layout.setHeight(
            context,
            heightPercent,
          ),
          color: backgroundColor,
        ),
        child,
      ],
    );
  }
}
