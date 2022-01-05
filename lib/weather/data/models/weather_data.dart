import 'package:flutter_weather/weather/data/models/clouds.dart';
import 'package:flutter_weather/weather/data/models/coordinates.dart';
import 'package:flutter_weather/weather/data/models/main_data.dart';
import 'package:flutter_weather/weather/data/models/system_data.dart';
import 'package:flutter_weather/weather/data/models/weather.dart';
import 'package:flutter_weather/weather/data/models/wind.dart';

class WeatherData {
  WeatherData({
    required this.coordinates,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  Coordinates coordinates;
  List<Weather> weather;
  String base;
  MainData main;
  int visibility; // Visibility, meter
  Wind wind;
  Clouds clouds;
  int dt; // Time of data calculation, unix, UTC
  SystemData sys;
  int timezone; // Shift in seconds from UTC
  int id; // City ID
  String name; // City name
  int cod;

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        coordinates: Coordinates.fromJson(json["coord"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"],
        main: MainData.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: SystemData.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coordinates.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}
