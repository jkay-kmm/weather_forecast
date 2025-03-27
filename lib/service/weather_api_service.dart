import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather_model.dart';

class WeatherApiService {
  static final String baseUrl = "https://api.weatherapi.com/v1";
  static final String apiKey = "b97a60bf605f417d8a4135940252703";
  // static final String apiKey = dotenv.env['WEATHER_API_KEY'] ?? '';
  String city = "Hanoi";
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url = Uri.parse("$baseUrl/current.json?key=$apiKey&q=$city&aqi=no");

    print("Fetching data from: $url"); // Debug API URL
    print("API Key: $apiKey");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("API Response: $data"); // Debug dữ liệu trả về
      return data;
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
      throw Exception("Failed to load weather data");
    }
  }


}
