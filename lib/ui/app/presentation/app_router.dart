import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/auth/auth.dart';
import 'package:tennis_booking/ui/features/home/home.dart';

class AppRouter {
  static final key = GlobalKey<NavigatorState>();

  static GoRouter routes = GoRouter(
    navigatorKey: key,
    initialLocation: '/signin',
    routes: [
      ...AuthRouter.routes,
      ...HomeRouter.routes,
    ],
  );
}
