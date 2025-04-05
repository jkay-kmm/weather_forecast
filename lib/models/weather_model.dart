class Weather {
  final String cityName;
  final double temperatureC;
  final String conditionText;
  final String iconUrl;
  final int humidity;
  final double windSpeed;
  Weather({
    required this.cityName,
    required this.temperatureC,
    required this.conditionText,
    required this.iconUrl,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json, {String? cityNameOverride}) {
    return Weather(
      cityName: cityNameOverride ?? json['location']['name'],
      temperatureC: json['current']['temp_c'],
      conditionText: json['current']['condition']['text'],
      iconUrl: "https:${json['current']['condition']['icon']}",
      humidity: json['current']['humidity'],
        windSpeed: json['current']['wind_mph']?.toDouble() ?? 0.0,
    );
  }
}
