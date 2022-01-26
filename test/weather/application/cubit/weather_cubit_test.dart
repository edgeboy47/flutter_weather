import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather/weather/application/cubit/weather_cubit.dart';
import 'package:flutter_weather/weather/data/models/models.dart';
import 'package:flutter_weather/weather/data/services/location_service.dart';
import 'package:flutter_weather/weather/data/services/weather_service.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherService extends Mock implements WeatherService {}

class MockLocationService extends Mock implements LocationService {}

class MockLocationData extends Mock implements LocationData {}

class MockWeatherData extends Mock implements WeatherData {}

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
      // When location is null
      test('Location is null', () async {
        // ARRANGE
        when(() => mockLocationService.getLocation())
            .thenAnswer((_) async => null);

        // ACT
        final response = await weatherCubit.getCurrentLocation();

        // ASSERT
        expect(response, isNull);
      });

      // TODO: When location is not null
      test('Location is returned', () async {
        // ARRANGE
        when(() => mockLocationService.getLocation())
            .thenAnswer((_) async => MockLocationData());

        // ACT
        final response = await weatherCubit.getCurrentLocation();

        // ASSERT
        expect(response, isA<LocationData>());
      });
    });

    group('getCurrentWeather - ', () {
      // When location is null
      blocTest<WeatherCubit, WeatherState>(
        'emits corrects states when location is null',
        build: () => weatherCubit,
        setUp: () {
          when(() => mockLocationService.getLocation())
              .thenAnswer((_) async => null);
        },
        act: (cubit) => cubit.getCurrentWeather(),
        expect: () => [
          WeatherLoadInProgress(),
          const WeatherLoadError(
              error: "Failure retrieving device location. Please try again"),
        ],
      );

      // When weather is null
      blocTest<WeatherCubit, WeatherState>(
        'emits correct states when weather is null',
        build: () => weatherCubit,
        setUp: () {
          final mockLocationData = MockLocationData();

          when(() => mockLocationService.getLocation())
              .thenAnswer((_) async => mockLocationData);

          when(() => mockLocationData.latitude).thenReturn(1.0);
          when(() => mockLocationData.longitude).thenReturn(1.0);
          when(() => mockWeatherService.getCurrentWeather(any(), any()))
              .thenAnswer((_) async => null);
        },
        act: (bloc) => bloc.getCurrentWeather(),
        expect: () => <WeatherState>[
          WeatherLoadInProgress(),
          const WeatherLoadError(error: "Loading failed. Please try again"),
        ],
      );

      // TODO: When weather is not null

      blocTest<WeatherCubit, WeatherState>(
          'emits correct states when weather is not null',
          build: () => weatherCubit,
          setUp: () {
            final mockLocationData = MockLocationData();
            final mockWeatherData = MockWeatherData();

            when(() => mockLocationService.getLocation())
                .thenAnswer((_) async => mockLocationData);

            when(() => mockLocationData.latitude).thenReturn(1.0);
            when(() => mockLocationData.longitude).thenReturn(1.0);
            when(() => mockWeatherService.getCurrentWeather(any(), any()))
                .thenAnswer((_) async => mockWeatherData);
          },
          act: (cubit) => cubit.getCurrentWeather(),
          expect: () => <dynamic>[
                WeatherLoadInProgress(),
                isA<WeatherLoadSuccess>().having((weather) => weather.weather,
                    'Weather Data', isA<WeatherData>()),
              ]);
    });
  });
}
