// import 'package:flutter/material.dart';

// class Category {
//   final String imagePath;
//   final String name;
//   final Color backgroundColor;

//   Category({
//     required this.imagePath,
//     required this.name,
//     required this.backgroundColor,
//   });

//   BoxDecoration get boxDecoration {
//     return BoxDecoration(
//       color: backgroundColor,
//       borderRadius: BorderRadius.circular(10),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black26,
//           offset: Offset(0, 2),
//           blurRadius: 6.0,
//         ),
//       ],
//     );
//   }
// }

// final List<Category> categories = [
//   Category(imagePath: 'assets/food_1.jpg', name: 'Food 1', backgroundColor: Colors.white),
//   Category(imagePath: 'assets/food_2.jpg', name: 'Food 2', backgroundColor: const Color.fromARGB(255, 238, 166, 166)),
//   Category(imagePath: 'assets/food_3.jpg', name: 'Food 3', backgroundColor: const Color.fromARGB(255, 87, 181, 235)),
// ];

// final List<Category> recommendations = [
//   Category(imagePath: 'assets/food_1.jpg', name: 'Food 1', backgroundColor: Colors.white),
//   Category(imagePath: 'assets/food_2.jpg', name: 'Food 2', backgroundColor: const Color.fromARGB(255, 221, 116, 116)),
//   Category(imagePath: 'assets/food_3.jpg', name: 'Food 3', backgroundColor: const Color.fromARGB(255, 121, 243, 121)),
// ];
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Category {
  final int id;
  final String name;
  final String imagePath;
  final Color backgroundColor;

  Category({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.backgroundColor,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      imagePath: json['imagePath'],
      backgroundColor: Color(
          int.parse(json['backgroundColor'].substring(1, 7), radix: 16) +
              0xFF000000),
    );
  }

  BoxDecoration get boxDecoration {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 2),
          blurRadius: 6.0,
        ),
      ],
    );
  }
}

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
