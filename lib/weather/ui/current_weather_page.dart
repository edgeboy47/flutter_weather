import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/utils/constants.dart';
import 'package:flutter_weather/utils/utils.dart';
import 'package:flutter_weather/weather/application/cubit/weather_cubit.dart';
import 'package:flutter_weather/weather/data/models/models.dart';
import 'package:flutter_weather/weather/ui/weather_chip.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColour,
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadInProgress) {
            return const WeatherLoadInProgressPage();
          }

          if (state is WeatherLoadError) {
            return WeatherLoadErrorPage(error: state.error);
          }

          if (state is WeatherLoadSuccess) {
            return WeatherLoadSuccessPage(weather: state.weather);
          }
          return const LinearProgressIndicator();
        },
      ),
    );
  }
}

class WeatherLoadInProgressPage extends StatelessWidget {
  const WeatherLoadInProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class WeatherLoadErrorPage extends StatelessWidget {
  const WeatherLoadErrorPage({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}

class WeatherLoadSuccessPage extends StatelessWidget {
  const WeatherLoadSuccessPage({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final WeatherData weather;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<WeatherCubit>().getCurrentWeather(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Text(
                          weather.name,
                          style: const TextStyle(
                            color: Color(0xFF7c8492),
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          weather.sys.country,
                          style: const TextStyle(
                            color: kGreenBlue,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          width: 125,
                          height: 125,
                          child: Placeholder(),
                        ),
                        const SizedBox(height: 20),
                        Chip(
                          backgroundColor: kGreenBlue,
                          label: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              weather.weather.first.main.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.6,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "${weather.main.temp.round().toString()}°C",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            WeatherChip(
                              icon: Icons.water,
                              text: '${weather.main.humidity}%',
                            ),
                            WeatherChip(
                              icon: Icons.air,
                              text:
                                  "${windSpeedInKMperHour(weather.wind.speed)}KM/H",
                            ),
                          ],
                        ),
                      ],
                    )),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: const [
                      WeatherPageSettingTile(
                        leading: "TEMPERATURE",
                        trailing: "CELSIUS",
                      ),
                      Divider(
                        thickness: 0.1,
                        color: Colors.grey,
                      ),
                      WeatherPageSettingTile(
                        leading: "WIND SPEED",
                        trailing: "km/h",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherPageSettingTile extends StatelessWidget {
  const WeatherPageSettingTile({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        leading,
        style: const TextStyle(
          color: Color(0xFFadaeb0),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            trailing,
            style: const TextStyle(color: kGreenBlue),
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kGreenBlue,
          ),
        ],
      ),
    );
  }
}
