import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fitness/models/popular_categories.dart';

class PopularCategoryService {
  static const String baseUrl = 'http://192.168.8.156:8080/api'; // Use your machine's IP address

  static Future<List<PopularCategory>> fetchPopularCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/popular-items'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => PopularCategory.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load popular categories');
    }
  }
}