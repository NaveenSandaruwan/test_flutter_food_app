import 'package:fitness/models/search_item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchItemService {
  static const String baseUrl = 'http://192.168.8.156:8080/api'; // Use your machine's IP address

  static Future<List<SearchItem>> fetchSearchItems() async {
    final response = await http.get(Uri.parse('$baseUrl/search-items'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => SearchItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load search items');
    }
  }
}