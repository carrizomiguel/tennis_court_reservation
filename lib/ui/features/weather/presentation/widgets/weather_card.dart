import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    this.date,
  });

  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          final weather = state.weather;
          final dateTime = date ?? DateTime.now();

          switch (state.status) {
            case WeatherStatus.loading:
              return ShimmerLoading(
                borderRadius: 20,
                height: Layout.setHeight(context, 10),
              );
            case WeatherStatus.success:
              return WeatherCardContent(
                weather: weather,
                date: dateTime,
              );
            case WeatherStatus.error:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class WeatherCardContent extends StatelessWidget {
  const WeatherCardContent({
    super.key,
    required this.weather,
    required this.date,
  });

  final WeatherModel weather;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final nowIndex = weather.time.indexOf(
      weather.time.firstWhere(
        (e) => e.day == date.day && e.hour == date.hour,
        orElse: () {
          final tomorrow = DateTime.now().add(const Duration(days: 1));
          return weather.time.firstWhere(
            (e) => e.day == tomorrow.day && e.hour == tomorrow.hour,
          );
        },
      ),
    );

    final isByDay = date.hour > 5 && date.hour < 18;
    final day = date.day == DateTime.now().day
        ? 'Today'
        : '${DateFormat.EEEE().format(date)} ${date.day}';

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isByDay
              ? [
                  Colors.lightBlue.shade300,
                  Colors.blue,
                  Colors.blue.shade600,
                ]
              : const [
                  Color(0xFF2f3f81),
                  Color(0xFF1D2B5C),
                  Color(0xFF0A113D),
                ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: kShadowColor.withAlpha(20),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$day Weather:',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              FittedBox(
                child: Text(
                  WeatherModel.getInfoByCode(
                    weather.weatherCode[nowIndex],
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 10,
                  ),
                  Text(
                    'Lima',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                '${(weather.temperature[nowIndex]).round()}°C',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.weatherIcon('09d'),
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    '${weather.precipitationProbability[nowIndex]}%',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            Assets.weatherIcon(
              WeatherModel.getIconByCode(
                weather.weatherCode[nowIndex],
                isEarly: date.hour < 18,
              ),
            ),
            height: 60,
            width: 60,
          ),
        ],
      ),
    );
  }
}
