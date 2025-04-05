import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../service/weather_api_service.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = false;

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeather(city);
    } catch (e) {
      print('Error fetching weather: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
