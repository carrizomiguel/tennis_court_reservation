import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final weather = state.weather;
        final date = DateTime.now();
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

        return Container(
          margin: EdgeInsets.only(
            top: Layout.setHeight(context, 10),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                Assets.weatherIcon(
                  WeatherModel.getIconByCode(
                    weather.weatherCode[nowIndex],
                    isEarly: date.hour < 18,
                  ),
                ),
                height: Layout.setHeight(context, 30),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Container(
                  width: double.infinity,
                  height: Layout.setHeight(context, 30),
                  margin: EdgeInsets.only(
                    top: Layout.setHeight(context, 2),
                  ),
                  padding: const EdgeInsets.all(10),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: kShadowColor.withAlpha(25),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colors.black,
                          ),
                          Text(
                            'Lima',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${(weather.temperature[nowIndex]).round()}',
                            style: TextStyle(
                              fontSize: Layout.setHeight(context, 15),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '°',
                            style: TextStyle(
                              fontSize: Layout.setHeight(context, 10),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Text(
                        WeatherModel.getInfoByCode(
                          weather.weatherCode[nowIndex],
                        ),
                        style: TextStyle(
                          fontSize: Layout.setHeight(context, 4),
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
