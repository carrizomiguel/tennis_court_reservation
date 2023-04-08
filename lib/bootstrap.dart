import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/auth/auth.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Storage.initialize();
      final client = http.Client();

      // Sign In
      final signInRemoteDataSource = SignInRemoteDataSourceImpl();

      // Weather
      final weatherRemoteDataSource = WeatherRemoteDataSourceImpl(
        client: client,
      );

      // Explore
      final courtRemoteDataSource = CourtRemoteDataSourceImpl();

      // Schedule
      final scheduleLocalDataSource = ScheduleLocalDataSourceImpl();

      runApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => SignInRepositoryImpl(
                remoteDataSource: signInRemoteDataSource,
              ),
            ),
            RepositoryProvider(
              create: (context) => WeatherRepositoryImpl(
                remoteDataSource: weatherRemoteDataSource,
              ),
            ),
            RepositoryProvider(
              create: (context) => CourtRepositoryImpl(
                remoteDataSource: courtRemoteDataSource,
              ),
            ),
            RepositoryProvider(
              create: (context) => ScheduleRepositoryImpl(
                localDataSource: scheduleLocalDataSource,
              ),
            ),
          ],
          child: await builder(),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
