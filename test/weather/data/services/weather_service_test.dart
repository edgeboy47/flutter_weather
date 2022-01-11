import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/weather/data/models/models.dart';
import 'package:flutter_weather/weather/data/services/weather_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../mock_data.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('Weather Service:', () {
    late MockHttpClient mockClient;
    late MockResponse mockResponse;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      mockClient = MockHttpClient();
      mockResponse = MockResponse();
    });

    group("Valid API response:", () {
      final validData = validResponse;
      late WeatherService service;

      setUp(() {
        when(() => mockResponse.statusCode).thenReturn(200);
        when(() => mockResponse.body).thenReturn(validData);
        when(() => mockClient.get(any())).thenAnswer((_) async => mockResponse);
        service = WeatherService(mockClient);
      });
      test(
          'Given the weatherService When getCurrentWeather is called Then an object of type WeatherData is returned',
          () async {
        // ARRANGE

        // ACT
        final response = await service.getCurrentWeather(1, 1);

        // ASSERT
        expect(response, isA<WeatherData>());
      });

      test(
          'Given the weatherService When getCurrentWeather is called Then the data is parsed correctly',
          () async {
        // ARRANGE
        
        // ACT
        final response = await service.getCurrentWeather(1, 1);

        // ASSERT
        expect(
            response,
            isA<WeatherData>()
                .having((weather) => weather.name, 'City Name', 'Saint Clair')
                .having((weather) => weather.coordinates, 'Coordinates',
                    isA<Coordinates>())
                .having((weather) => weather.weather, 'Weather',
                    isA<List<Weather>>())
                .having((weather) => weather.main, 'Main Data', isA<MainData>())
                .having((weather) => weather.sys, 'System Data',
                    isA<SystemData>()));
      });
    });
  });
}
