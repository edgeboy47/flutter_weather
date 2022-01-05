class SystemData {
  SystemData({
    this.type,
    this.id,
    this.message,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  int? type;
  int? id;
  String? message;
  String country; // Country code (GB, JP etc.)
  int sunrise; // Sunrise time, unix, UTC
  int sunset; // Sunset time, unix, UTC

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
}
