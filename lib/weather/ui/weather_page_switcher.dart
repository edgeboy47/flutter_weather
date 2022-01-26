import 'package:flutter/material.dart';
import 'package:flutter_weather/utils/constants.dart';
import 'package:flutter_weather/weather/ui/current_weather_page.dart';
import 'package:flutter_weather/weather/ui/favourites_page.dart';
import 'package:flutter_weather/weather/ui/seven_day_forecast_page.dart';

class WeatherPageSwitcher extends StatefulWidget {
  const WeatherPageSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherPageSwitcher> createState() => _WeatherPageSwitcherState();
}

class _WeatherPageSwitcherState extends State<WeatherPageSwitcher> {
  late final PageController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: FloatingNavBar(
        index: _selectedIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Center(
        child: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            SevenDayForecastPage(),
            FavouritesPage(),
            CurrentWeatherPage(),
          ],
        ),
      ),
    );
  }
}

class FloatingNavBar extends StatelessWidget {
  const FloatingNavBar({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 8, right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade600.withOpacity(0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                onTap(0);
              },
              icon: Icon(
                Icons.home_outlined,
                size: 36,
                color: index == 0 ? kGreenBlue : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                onTap(1);
              },
              icon: Icon(
                Icons.favorite_outline,
                size: 36,
                color: index == 1 ? kGreenBlue : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                onTap(2);
              },
              icon: Icon(
                Icons.layers_outlined,
                size: 36,
                color: index == 2 ? kGreenBlue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
