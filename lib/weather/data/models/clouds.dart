import 'package:equatable/equatable.dart';

class Clouds extends Equatable{
  const Clouds({
    required this.all,
  });

  final int all; // Cloudiness, %

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };

  @override
  List<Object> get props => [all];
}
