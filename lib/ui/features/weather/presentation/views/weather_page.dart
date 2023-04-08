import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  static Page<dynamic> page() {
    return const NoTransitionPage<void>(
      child: WeatherPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const WeatherBody();
  }
}

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const WeatherCustomBackground(
      child: WeatherInfo(),
    );
  }
}
