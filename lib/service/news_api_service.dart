import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news_model.dart';


class ApiService {
  static const String _apiKey = '2_2lJpzAMW4476QrkYNx4dvqxCTqKIfDCc-aaIUbPr9FFZEv';
  static const String _baseUrl = 'https://api.currentsapi.services/v1/latest-news';

  static Future<List<NewsArticle>> fetchNews() async {
    final response = await http.get(Uri.parse("$_baseUrl?language=vi&apiKey=$_apiKey"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List articles = data['news'];
      final news = data['news'][0];
      return articles.map((e) => NewsArticle.fromJson(e)).toList() ;
    } else {
      throw Exception("Failed to load news");
    }
  }
  static Future<FeaturedNews> fetchFeaturedNews() async {
    final response = await http.get(Uri.parse("$_baseUrl?language=vi&apiKey=$_apiKey"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final news = data['news'][0]; // Lấy tin đầu tiên làm tin nổi bật
      return FeaturedNews.fromJson(news);
    } else {
      throw Exception("Không thể tải tin nổi bật.");
    }
  }
}
