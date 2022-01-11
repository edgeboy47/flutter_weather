import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/weather/application/cubit/weather_cubit.dart';
import 'package:flutter_weather/weather/data/services/location_service.dart';
import 'package:flutter_weather/weather/data/services/weather_service.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherService extends Mock implements WeatherService {}

class MockLocationService extends Mock implements LocationService {}

void main() {
  late MockWeatherService mockWeatherService;
  late MockLocationService mockLocationService;
  late WeatherCubit weatherCubit;
  
  group('WeatherCubit: ', () {
    setUpAll(() {
      mockWeatherService = MockWeatherService();
      mockLocationService = MockLocationService();
    });

    setUp(() {
        weatherCubit = WeatherCubit(
          weatherService: mockWeatherService,
          locationService: mockLocationService,
        );
      });

    group('getCurrentLocation -', () {
      // TODO: When location is null
      test('Location is null', () {});

      // TODO: When location is not null
      test('Location is returned', () {});
    });

    group('getCurrentWeather - ', () {
      // TODO: When weather is null
      test('Weather is null', () {});

      //TODO: When weather is not null
      test('Weather is returned', () {});
    });
  });
}
