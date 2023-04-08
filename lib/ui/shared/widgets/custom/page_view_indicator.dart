import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({
    super.key,
    required this.length,
    required this.currentPage,
  });

  final int length;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) {
          final isCurrentIndex = currentPage == index;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(
              horizontal: 3,
            ),
            height: 3,
            decoration: BoxDecoration(
              color: isCurrentIndex
                  ? kSecondaryColor
                  : kSecondaryColor.withOpacity(.3),
              borderRadius: BorderRadius.circular(15),
            ),
            width: isCurrentIndex ? 18 : 8,
          );
        },
      ),
    );
  }
}
