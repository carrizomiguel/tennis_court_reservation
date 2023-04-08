import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: Layout.setHeight(context, 20),
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 25,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor.withAlpha(20),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Live a Professional Experience',
                        style: TextStyle(
                          fontSize: 25,
                          color: kSecondaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: Layout.setHeight(context, 1)),
                      const AvailableSports()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            right: -10,
            child: Image.asset(
              Assets.tennisPlayer,
              height: Layout.setHeight(context, 25),
            ),
          ),
        ],
      ),
    );
  }
}

class AvailableSports extends StatelessWidget {
  const AvailableSports({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: kAccentColor,
          radius: 25,
          child: SvgPicture.asset(
            Assets.tennisIcon,
            height: 35,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Coming Soon',
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: 11,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: kSecondaryColor,
                  radius: 13,
                  child: SvgPicture.asset(
                    Assets.footballIcon,
                    height: 12,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: kSecondaryColor,
                  radius: 13,
                  child: SvgPicture.asset(
                    Assets.volleyballIcon,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: kSecondaryColor,
                  radius: 13,
                  child: SvgPicture.asset(
                    Assets.basketballIcon,
                    height: 12,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
