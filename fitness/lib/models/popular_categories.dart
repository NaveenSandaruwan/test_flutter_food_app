// import 'package:flutter/material.dart';

// class PopularCategory {
//   final String imagePath;
//   final String name;
//   final Color backgroundColor;

//   PopularCategory({
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

// final List<PopularCategory> popularCategories = [
//   PopularCategory(imagePath: 'assets/food_1.jpg', name: 'Food 1', backgroundColor: Colors.white),
//   PopularCategory(imagePath: 'assets/food_2.jpg', name: 'Food 2', backgroundColor: Colors.white),
//   PopularCategory(imagePath: 'assets/food_3.jpg', name: 'Food 3', backgroundColor: Colors.white),
//   // PopularCategory(imagePath: 'assets/food_4.jpg', name: 'Food 4', backgroundColor: Colors.white),
//   // PopularCategory(imagePath: 'assets/food_5.jpg', name: 'Food 5', backgroundColor: Colors.white),
// ];

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PopularCategory {
  final int id;
  final String name;
  final String imagePath;
  final Color backgroundColor;

  PopularCategory({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.backgroundColor,
  });

  factory PopularCategory.fromJson(Map<String, dynamic> json) {
    return PopularCategory(
      id: json['id'],
      name: json['name'],
      imagePath: json['imagePath'],
      backgroundColor: Color(int.parse(json['backgroundColor'].substring(1, 7), radix: 16) + 0xFF000000),
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