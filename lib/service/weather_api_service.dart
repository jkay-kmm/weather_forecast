import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  static const String _apiKey = 'bc219aec11944417acd22604250504';
  static const String _baseUrl = 'https://api.weatherapi.com/v1';
  String city = 'Hà Nội';

  Future<Weather> fetchWeather(String city) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/current.json?key=$_apiKey&q=$city&&lang=vi'),
    );

    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);
      final data = jsonDecode(decoded);
      print(data);
      if (data['current']['condition']['code'] == 1063) {
        // Nếu mã là 1063, đổi thành 1183
        data['current']['condition']['code'] = 1183;
        data['current']['condition']['text'] = "Mưa nhẹ";  // Cập nhật text tương ứng
      }
      return Weather.fromJson(data, cityNameOverride: city);
    } else {
      throw Exception('Lỗi tải dữ liệu thời tiết');
    }
  }

}
