import 'location_model.dart';

class Weather {
  final Location location;
  final double temperature;
  final double humidity;
  final String condition;

  Weather({
    required this.location,
    required this.temperature,
    required this.humidity,
    required this.condition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: Location.fromJson(json['location']),
      temperature: json['current']['temp_c'].toDouble(),
      humidity: json['current']['humidity'].toDouble(),
      condition: json['current']['condition']['text'],
    );
  }
}
