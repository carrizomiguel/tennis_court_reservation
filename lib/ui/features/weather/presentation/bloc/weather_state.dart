part of 'weather_bloc.dart';

enum WeatherStatus {
  loading,
  success,
  error,
}

class WeatherState extends Equatable {
  const WeatherState({
    this.status = WeatherStatus.loading,
    this.weather = const WeatherModel.empty(),
  });

  final WeatherStatus status;
  final WeatherModel weather;

  WeatherState copyWith({
    WeatherStatus? status,
    WeatherModel? weather,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
    );
  }

  @override
  List<Object?> get props => [status, weather];
}
