import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class WeatherCustomBackground extends StatelessWidget {
  const WeatherCustomBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final isByDay = date.hour > 5 && date.hour < 18;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: Layout.setHeight(context, 60),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isByDay
                  ? [
                      Colors.blue.shade600,
                      Colors.blue,
                      Colors.lightBlue.shade300,
                      Colors.white,
                    ]
                  : [
                      const Color(0xFF0A113D),
                      const Color(0xFF1D2B5C),
                      const Color(0xFF2f3f81),
                      const Color(0xFF55639e),
                      const Color(0xFFa9b2d5),
                      Colors.white,
                    ],
              stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
