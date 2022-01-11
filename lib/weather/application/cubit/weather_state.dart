part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  const WeatherLoadSuccess(this.weather);

  final WeatherData weather;

  @override
  List<Object> get props => [weather];
}

class WeatherLoadError extends WeatherState {
  const WeatherLoadError({required this.error});
 
  final String error;

  @override
  List<Object> get props => [error];
}
