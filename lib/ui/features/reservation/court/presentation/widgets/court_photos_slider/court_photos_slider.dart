import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class CourtPhotosSlider extends StatelessWidget {
  const CourtPhotosSlider({
    super.key,
    required this.court,
  });

  final CourtModel court;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: BuilderPersistentDelegate(
        maxExtent: Layout.setHeight(context, 100),
        minExtent: Layout.setHeight(context, 70),
        builder: (percent) {
          return CourtSliderLayout(
            topPercent: ((1 - percent) / .7).clamp(0.0, 1.0),
            bottomPercent: (percent / .3).clamp(0.0, 1.0),
            court: court,
          );
        },
      ),
    );
  }
}

class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  BuilderPersistentDelegate({
    required double maxExtent,
    required double minExtent,
    required this.builder,
  })  : _maxExtent = maxExtent,
        _minExtent = minExtent;

  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(
    covariant SliverPersistentHeaderDelegate oldDelegate,
  ) {
    return false;
  }
}
