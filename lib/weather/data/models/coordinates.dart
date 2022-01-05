class Coordinates {
  Coordinates({
    required this.lon,
    required this.lat,
  });

  double lon; // City geo location, longitude
  double lat; // City geo location, latitude

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}
