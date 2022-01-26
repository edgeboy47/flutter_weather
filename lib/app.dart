import 'package:flutter/material.dart';
import 'package:flutter_weather/weather/ui/weather_page_switcher.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: WeatherPageSwitcher(),
      ),
    );
  }
}

