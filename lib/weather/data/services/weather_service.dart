import 'package:http/http.dart' as http;

class WeatherService {
  final String endpoint = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey =
      '9fdb42837812cea566a3add40712ff8d'; // TODO: To be set in the environment variables

  Future<String> getCurrentWeather(double latitude, double longitude) async {
    final String url =
        '$endpoint?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey';

    final response = await http.get(Uri.parse(url));
    return response.body;
  }
}
