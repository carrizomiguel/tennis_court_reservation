import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class EmptySchedule extends StatelessWidget {
  const EmptySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EmptyScheduleCard(),
        SizedBox(height: Layout.setHeight(context, 2)),
        const WeatherCard(),
      ],
    );
  }
}

class EmptyScheduleCard extends StatelessWidget {
  const EmptyScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Container(
        width: double.infinity,
        height: Layout.setHeight(context, 50),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: kShadowColor.withAlpha(20),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              Assets.calendar,
            ),
            const SizedBox(height: 10),
            Text(
              'You have no reservations',
              style: TextStyle(
                color: Colors.grey.shade300,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Go to Explore'),
            )
          ],
        ),
      ),
    );
  }
}
