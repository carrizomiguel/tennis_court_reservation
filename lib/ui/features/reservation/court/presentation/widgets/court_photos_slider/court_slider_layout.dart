import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class CourtSliderLayout extends StatelessWidget {
  const CourtSliderLayout({
    super.key,
    required this.topPercent,
    required this.bottomPercent,
    required this.court,
  });

  final double topPercent;
  final double bottomPercent;
  final CourtModel court;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRect(
          child: Padding(
            padding: EdgeInsets.only(
              top: (20 + topPadding) * (1 - bottomPercent),
              bottom: 220 * (1 - bottomPercent),
            ),
            child: Transform.scale(
              scale: lerpDouble(.95, 1.3, bottomPercent),
              child: CourtPhotosPageView(
                photos: court.photos,
              ),
            ),
          ),
        ),
        const NavigationHeader(),
        Positioned.fill(
          top: null,
          child: Container(
            height: Layout.setHeight(context, 13),
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Text(
                  court.name,
                  style: const TextStyle(
                    fontSize: 50,
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => context.push('/calendar/${court.id}'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                  ),
                  child: const Text(
                    'Book Now',
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class NavigationHeader extends StatelessWidget {
  const NavigationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: null,
      child: Container(
        height: Layout.setHeight(context, 23),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 18,
        ),
        decoration: const BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              Assets.tennisIcon,
              height: 23,
              width: 23,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
