import 'package:equatable/equatable.dart';

class Coordinates extends Equatable {
  const Coordinates({
    required this.lon,
    required this.lat,
  });

  final double lon; // City geo location, longitude
  final double lat; // City geo location, latitude

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };

      @override
  List<Object> get props => [lon, lat];
}
