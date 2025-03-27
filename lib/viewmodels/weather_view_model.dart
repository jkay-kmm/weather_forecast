import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../service/weather_api_service.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherApiService _weatherApiService = WeatherApiService();
  Weather? _weather;
  List<Weather> _hourlyWeather = [];
  bool _isLoading = false;

  Weather? get weather => _weather;
  List<Weather> get hourlyWeather => _hourlyWeather;
  bool get isLoading => _isLoading;

  Future<void> getWeather(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _weatherApiService.fetchWeather(city);

      // ✅ Lấy thông tin thời tiết hiện tại
      _weather = Weather.fromJson(data["current"]);

      // ✅ Lấy thông tin thời tiết theo giờ
      _hourlyWeather = (data['forecast']['forecastday'][0]['hour'] as List)
          .map((json) => Weather.fromJson(json))
          .toList();

      print("Weather Data Loaded: $_weather");
      print("Hourly Weather Data Loaded: $_hourlyWeather");

    } catch (e) {
      print("Error: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
