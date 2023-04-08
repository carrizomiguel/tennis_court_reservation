import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tennis_booking/core/core.dart';
import 'package:tennis_booking/ui/features/weather/weather.dart';

import '../../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late WeatherRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = WeatherRemoteDataSourceImpl(
      client: mockHttpClient,
    );
  });

  group('Weather Data Source', () {
    test('should return a WheatherModel when succeed', () async {
      final response = http.Response(fixture('weather_response.json'), 200);
      when(
        () => mockHttpClient.get(
          Uri.https(
            'api.open-meteo.com',
            '/v1/forecast',
            {
              'latitude': '-12.04',
              'longitude': '-77.03',
              'hourly': 'temperature_2m,precipitation_probability,weathercode',
            },
          ),
        ),
      ).thenAnswer((_) async => response);
      final result = await dataSource.getWeather();
      expect(result, isA<WeatherModel>());
    });

    test('should throw BadRequestException when failed', () async {
      when(
        () => mockHttpClient.get(
          Uri.https(
            'api.open-meteo.com',
            '/v1/forecast',
            {
              'latitude': '-12.04',
              'longitude': '-77.03',
              'hourly': 'temperature_2m,precipitation_probability,weathercode',
            },
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response('', 500),
      );
      expect(
        () => dataSource.getWeather(),
        throwsA(isA<BadRequestException>()),
      );
    });

    tearDown(() {
      mockHttpClient.close();
    });
  });
}
