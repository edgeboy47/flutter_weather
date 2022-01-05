class Clouds {
  Clouds({
    required this.all,
  });

  int all; // Cloudiness, %

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}
