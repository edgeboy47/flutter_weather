import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id; // Weather condition id
  final String main; // Group of weather parameters (Rain, Snow, Extreme etc.)
  final String description; // Weather condition within the group
  final String icon; // Weather icon id

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };

  @override
  List<Object> get props => [
        id,
        main,
        description,
        icon,
      ];
}
