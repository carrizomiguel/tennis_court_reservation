import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/reservation/reservation.dart';
import 'package:tennis_booking/ui/features/schedule/schedule.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.content,
  });

  static Page<dynamic> page(Widget content) {
    return NoTransitionPage<void>(
      child: HomeScreen(
        content: content,
      ),
    );
  }

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => WeatherBloc(
            repository: context.read<WeatherRepositoryImpl>(),
          )..add(WeatherRequested()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => CourtBloc(
            repository: context.read<CourtRepositoryImpl>(),
          )..add(CourtRequested()),
        ),
        BlocProvider(
          create: (context) => ScheduleBloc(
            repository: context.read<ScheduleRepositoryImpl>(),
          )..add(ScheduleRequested()),
        ),
      ],
      child: HomeContent(
        content: content,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
    required this.content,
  });

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
