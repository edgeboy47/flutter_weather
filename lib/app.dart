import 'package:flutter/material.dart';
import 'package:flutter_weather/weather/data/services/location_service.dart';
import 'package:flutter_weather/weather/data/services/weather_service.dart';
import 'package:http/http.dart' as http;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final weatherService = WeatherService(http.Client());

  final locationService = LocationService();

  Future? currentWeather;

  Future? currentLocation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Weather'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                FutureBuilder(
                  future: currentWeather ??
                      weatherService.getCurrentWeather(10.682368, -61.5317504),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text("The weather is ${snapshot.data}");
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                FutureBuilder(
                  future: currentLocation,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.toString());
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Text(snapshot.toString());
                  },
                ),
                ElevatedButton(
                  child: const Text("Get Location"),
                  onPressed: () {
                    currentLocation = locationService.getLocation();
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
