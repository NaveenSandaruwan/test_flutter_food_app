
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

