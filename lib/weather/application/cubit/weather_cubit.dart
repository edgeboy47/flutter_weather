import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather/weather/data/models/models.dart';
import 'package:flutter_weather/weather/data/services/location_service.dart';
import 'package:flutter_weather/weather/data/services/weather_service.dart';
import 'package:location/location.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required WeatherService weatherService,
    required LocationService locationService,
  })  : _weatherService = weatherService,
        _locationService = locationService,
        super(WeatherInitial());

  final WeatherService _weatherService;
  final LocationService _locationService;

  Future<WeatherData?> getCurrentWeather() async {
    emit(WeatherLoadInProgress());

    // Retrieve device location
    final location = await getCurrentLocation();

    if (location != null) {
      final weather =
          await _weatherService.getCurrentWeather(location.latitude!, location.longitude!);

      if (weather != null) {
        emit(WeatherLoadSuccess(weather));
      } else {
        emit(const WeatherLoadError(error: "Loading failed. Please try again"));
      }
    } else {
      emit(const WeatherLoadError(
        error: "Failure retrieving device location. Please try again",
      ));
    }
  }

  Future<LocationData?> getCurrentLocation() async {
    final location = await _locationService.getLocation();

    return location;
  }
}
