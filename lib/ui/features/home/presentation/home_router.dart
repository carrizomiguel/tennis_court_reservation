import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/auth/auth.dart';
import 'package:tennis_booking/ui/features/explore/explore.dart';
import 'package:tennis_booking/ui/features/home/home.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';

class HomeRouter {
  static final screenkey = GlobalKey<NavigatorState>();
  static final pagekey = GlobalKey<NavigatorState>();

  static List<ShellRoute> routes = [
    ShellRoute(
      navigatorKey: screenkey,
      pageBuilder: (context, state, child) {
        return HomeScreen.page(child);
      },
      routes: [
        ShellRoute(
          navigatorKey: pagekey,
          pageBuilder: (context, state, child) {
            return HomePage.page(child);
          },
          routes: [
            GoRoute(
              path: '/schedule',
              parentNavigatorKey: pagekey,
              pageBuilder: (context, state) => SchedulePage.page(),
            ),
            GoRoute(
              path: '/explore',
              parentNavigatorKey: pagekey,
              pageBuilder: (context, state) => ExplorePage.page(),
            ),
            GoRoute(
              path: '/weather',
              parentNavigatorKey: pagekey,
              pageBuilder: (context, state) => WeatherPage.page(),
            ),
            GoRoute(
              path: '/account',
              parentNavigatorKey: pagekey,
              pageBuilder: (context, state) => AccountPage.page(),
            ),
          ],
        ),
        ...ReservationRouter.routes(screenkey),
      ],
    )
  ];
}
