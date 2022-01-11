import 'package:equatable/equatable.dart';

class MainData extends Equatable {
  const MainData({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  final double temp; // Temperature.
  final double
      feelsLike; // Temperature. This temperature parameter accounts for the human perception of weather.
  final double tempMin; // Minimum temperature at the moment.
  final double tempMax; // Maximum temperature at the moment.
  final int
      pressure; // Atmospheric pressure (on the sea level, if there is no sea_level or grnd_level data), hPa
  final int humidity; // Humidity, %

  factory MainData.fromJson(Map<String, dynamic> json) => MainData(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };

  @override
  List<Object> get props =>
      [temp, feelsLike, tempMin, tempMax, pressure, humidity];
}
