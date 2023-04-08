import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';

class ReservationRouter {
  static List<GoRoute> routes(GlobalKey<NavigatorState> key) {
    return [
      GoRoute(
        path: '/court/:courtId',
        parentNavigatorKey: key,
        pageBuilder: (context, state) {
          return CourtPage.page(
            int.parse(state.params['courtId']!),
          );
        },
      ),
      GoRoute(
        path: '/calendar/:courtId',
        parentNavigatorKey: key,
        pageBuilder: (context, state) {
          return CalendarPage.page(
            int.parse(state.params['courtId']!),
          );
        },
      ),
    ];
  }
}
