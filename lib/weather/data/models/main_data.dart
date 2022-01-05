class MainData {
    MainData({
        required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.humidity,
    });

    double temp; // Temperature.
    double feelsLike; // Temperature. This temperature parameter accounts for the human perception of weather. 
    double tempMin; // Minimum temperature at the moment.
    double tempMax; // Maximum temperature at the moment. 
    int pressure; // Atmospheric pressure (on the sea level, if there is no sea_level or grnd_level data), hPa
    int humidity; // Humidity, %

    factory MainData.fromJson(Map<String, dynamic> json) => MainData(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
    };
}