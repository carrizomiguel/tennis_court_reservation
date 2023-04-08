import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class ScheduleCourtRating extends StatelessWidget {
  const ScheduleCourtRating({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: kAccentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star_rounded,
            color: Colors.white,
            size: 15,
          ),
          Text(
            rating.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
