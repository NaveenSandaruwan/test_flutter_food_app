// import 'package:flutter/material.dart';

// class SearchItem {
//   final String name;
//   final String imagePath;
//   final Color backgroundColor;

//   SearchItem({
//     required this.name,
//     required this.imagePath,
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

// final List<SearchItem> searchItems = [
//   SearchItem(name: 'Food 1', imagePath: 'assets/food_1.jpg', backgroundColor: Colors.white),
//   SearchItem(name: 'Food 2', imagePath: 'assets/food_2.jpg', backgroundColor: Colors.white),
//   SearchItem(name: 'Food 3', imagePath: 'assets/food_3.jpg', backgroundColor: Colors.white),
//   // SearchItem(name: 'Food 4', imagePath: 'assets/food_4.jpg', backgroundColor: Colors.white),
//   // SearchItem(name: 'Food 5', imagePath: 'assets/food_5.jpg', backgroundColor: Colors.white),
// ];
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchItem {
  final int id;
  final String name;
  final String imagePath;
  final Color backgroundColor;

  SearchItem({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.backgroundColor,
  });

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
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