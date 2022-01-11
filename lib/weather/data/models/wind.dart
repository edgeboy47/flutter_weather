import 'package:equatable/equatable.dart';

class Wind extends Equatable {
  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final double
      speed; //  Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
  final int deg; // Wind direction, degrees (meteorological)
  final double
      gust; // Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };

  @override
  List<Object> get props => [
        speed,
        deg,
        gust,
      ];
}
