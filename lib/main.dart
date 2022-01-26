import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/weather/application/cubit/weather_cubit.dart';
import 'package:flutter_weather/weather/data/services/location_service.dart';
import 'package:flutter_weather/weather/data/services/weather_service.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'app.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocationService>(
          create: (context) => LocationService(
            location: Location(),
          ),
        ),
        RepositoryProvider<WeatherService>(
          create: (context) => WeatherService(
            http.Client(),
          ),
        )
      ],
      child: BlocProvider<WeatherCubit>(
        create: (context) => WeatherCubit(
          locationService: RepositoryProvider.of<LocationService>(context),
          weatherService: RepositoryProvider.of<WeatherService>(context),
        )..getCurrentWeather(),
        child: const App(),
      ),
    ),
  );
}
