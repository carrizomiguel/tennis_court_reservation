import 'dart:io';

import 'package:oxidized/oxidized.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';

abstract class WeatherRepository {
  Future<Result<WeatherModel, Failure>> getWeather();
}

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required this.remoteDataSource,
  });

  final WeatherRemoteDataSource remoteDataSource;

  @override
  Future<Result<WeatherModel, Failure>> getWeather() async {
    try {
      final remote = await remoteDataSource.getWeather();
      return Result.ok(remote);
    } on BadRequestException {
      return Result.err(BadRequestFailure());
    } on SocketException {
      return Result.err(SocketFailure());
    }
  }
}
