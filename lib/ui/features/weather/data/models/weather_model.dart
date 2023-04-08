import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  const WeatherModel({
    required this.time,
    required this.temperature,
    required this.precipitationProbability,
    required this.weatherCode,
  });

  const WeatherModel.empty()
      : this(
          time: const [],
          temperature: const [],
          precipitationProbability: const [],
          weatherCode: const [],
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      time: List<DateTime>.from(
        (json['time'] as List).map(
          (x) => DateTime.parse(x as String),
        ),
      ),
      temperature: List<double>.from(
        (json['temperature_2m'] as List).map((x) => x),
      ),
      precipitationProbability: List<int>.from(
        (json['precipitation_probability'] as List).map((x) => x),
      ),
      weatherCode: List<int>.from(
        (json['weathercode'] as List).map((x) => x),
      ),
    );
  }

  final List<DateTime> time;
  final List<double> temperature;
  final List<int> precipitationProbability;
  final List<int> weatherCode;

  static final codes = <int, List<String>>{
    0: ['Clear Sky', '01'],
    1: ['Few Clouds', '02'],
    2: ['Partly Cloudy', '03'],
    3: ['Overcast', '04'],
    45: ['Fog', '050'],
    48: ['Heavy Fog', '050'],
    51: ['Rain', '010'],
    53: ['Rain', '010'],
    55: ['Rain', '010'],
    56: ['Rain', '010'],
    57: ['Rain', '010'],
    61: ['Rain', '010'],
    63: ['Rain', '010'],
    65: ['Rain', '010'],
    80: ['Heavy Rain', '09'],
    81: ['Heavy Rain', '09'],
    82: ['Heavy Rain', '09'],
    95: ['Thunderstorm', '011'],
  };

  static String getInfoByCode(int code) {
    if (!codes.containsKey(code)) return '';
    return codes[code]!.first;
  }

  static String getIconByCode(int code, {required bool isEarly}) {
    return '${codes[code]!.last}${isEarly ? 'd' : 'n'}';
  }

  @override
  List<Object> get props => [
        time,
        temperature,
        precipitationProbability,
        weatherCode,
      ];
}
