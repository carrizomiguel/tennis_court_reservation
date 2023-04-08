import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/auth/sign_in/sign_in.dart';
import 'package:tennis_booking/ui/features/auth/sign_up/sign_up.dart';

class AuthRouter {
  static List<GoRoute> routes = [
    GoRoute(
      path: '/signin',
      pageBuilder: (context, state) => SignInPage.page(),
    ),
    GoRoute(
      path: '/signup',
      pageBuilder: (context, state) => SignUpPage.page(),
    ),
  ];
}
