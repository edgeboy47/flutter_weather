class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  double speed; //  Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
  int deg; // Wind direction, degrees (meteorological)
  double gust; // Wind gust. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour

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
}
