class Coordinates {
  Coordinates({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}
