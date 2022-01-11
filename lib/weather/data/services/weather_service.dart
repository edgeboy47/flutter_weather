import 'dart:convert';

import 'package:flutter_weather/weather/data/models/weather_data.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  WeatherService(this.client);

  final http.Client client;
  
  final String endpoint = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey =
      '9fdb42837812cea566a3add40712ff8d'; // TODO: To be set in the environment variables

  Future<WeatherData?> getCurrentWeather(
      double latitude, double longitude) async {
    try {
      final String url =
          '$endpoint?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey';

      final response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final weatherData = WeatherData.fromJson(json);
        return weatherData;
      }
      return null;
    } catch (e) {
      print('Error getting weather: $e');
    }
  }
}
