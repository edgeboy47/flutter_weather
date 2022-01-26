import 'package:flutter/material.dart';
import 'package:flutter_weather/utils/constants.dart';

class SevenDayForecastPage extends StatelessWidget {
  const SevenDayForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColour,
      child: Text(
        'Seven Day Forecast Page',
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
