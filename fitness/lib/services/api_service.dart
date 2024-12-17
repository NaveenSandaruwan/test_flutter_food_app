// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/category_model.dart';
// import '../models/popular_categories.dart';
// import '../models/search_item_model.dart';

// class ApiService {
//   static const String baseUrl = 'http://192.168.1.100:8080/api';

//   static Future<List<Category>> fetchCategories() async {
//     final response = await http.get(Uri.parse('$baseUrl/categories'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       print('Fetched Categories: $data'); // Print the fetched data
//       return data.map((json) => Category.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load categories');
//     }
//   }

//   static Future<List<PopularCategory>> fetchPopularCategories() async {
//     final response = await http.get(Uri.parse('$baseUrl/popular-items'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       print('Fetched Popular Categories: $data'); // Print the fetched data
//       return data.map((json) => PopularCategory.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load popular categories');
//     }
//   }

//   static Future<List<Category>> fetchRecommendations() async {
//     final response = await http.get(Uri.parse('$baseUrl/recommendations'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       print('Fetched Recommendations: $data'); // Print the fetched data
//       return data.map((json) => Category.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load recommendations');
//     }
//   }

//   static Future<List<SearchItem>> fetchSearchItems() async {
//     final response = await http.get(Uri.parse('$baseUrl/search-items'));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       print('Fetched Search Items: $data'); // Print the fetched data
//       return data.map((json) => SearchItem.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load search items');
//     }
//   }
// }
