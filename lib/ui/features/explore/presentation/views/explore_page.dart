import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/explore/explore.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  static Page<dynamic> page() {
    return const NoTransitionPage<void>(
      child: ExplorePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const ExploreBody();
  }
}

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      backgroundColor: kPrimaryColor,
      heightPercent: 23,
      child: SafeArea(
        child: Column(
          children: [
            const ExploreCustomAppBar(),
            const WelcomeCard(),
            SizedBox(height: Layout.setHeight(context, 5)),
            const CourtsList(),
          ],
        ),
      ),
    );
  }
}
