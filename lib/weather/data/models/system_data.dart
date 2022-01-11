import 'package:equatable/equatable.dart';

class SystemData extends Equatable {
  const SystemData({
    this.type,
    this.id,
    this.message,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final int? type;
  final int? id;
  final String? message;
  final String country; // Country code (GB, JP etc.)
  final int sunrise; // Sunrise time, unix, UTC
  final int sunset; // Sunset time, unix, UTC

  factory SystemData.fromJson(Map<String, dynamic> json) => SystemData(
        type: json["type"],
        id: json["id"],
        message: json["message"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "message": message,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };

  @override
  List<Object> get props => [
        country,
        sunrise,
        sunset,
      ];
}
