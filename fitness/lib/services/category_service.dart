import 'package:fitness/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryService {
  static const String baseUrl = 'http://192.168.8.156:8080/api';

  static Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<List<Category>> fetchRecommendations() async {
    final response = await http.get(Uri.parse('$baseUrl/recommendations'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load recommendations');
    }
  }
}
