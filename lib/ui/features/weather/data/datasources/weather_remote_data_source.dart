import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl({
    required this.client,
  });

  final http.Client client;

  final weatherId = Api.weatherId;
  final weatherAuthority = Api.weatherAuthority;
  final weatherPath = Api.weatherPath;

  @override
  Future<WeatherModel> getWeather() async {
    try {
      final response = await client.get(
        Uri.https(
          weatherAuthority,
          weatherPath,
          {
            'latitude': '-12.04',
            'longitude': '-77.03',
            'hourly': 'temperature_2m,precipitation_probability,weathercode',
          },
        ),
      );
      switch (response.statusCode) {
        case 200:
          final decoded = json.decode(response.body) as Map;
          final weather = WeatherModel.fromJson(
            decoded['hourly'] as Map<String, dynamic>,
          );
          return weather;
        case 500:
        default:
          throw BadRequestException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
