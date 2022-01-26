import 'package:flutter/material.dart';
import 'package:flutter_weather/utils/constants.dart';

class WeatherChip extends StatelessWidget {
  const WeatherChip({
    Key? key,
    required this.icon,
    required this.text,
    this.padding,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(
        icon,
        color: kGreenBlue,
      ),
      backgroundColor: kChipBackgroundColor,
      label: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(color: kGreenBlue),
        ),
      ),
    );
  }
}
