import 'package:flutter/material.dart';
import 'package:fitness/models/popular_categories.dart';

class ItemInfoPage extends StatelessWidget {
  final PopularCategory popularCategory;

  const ItemInfoPage({super.key, required this.popularCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(popularCategory.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                popularCategory.imagePath,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              popularCategory.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'This is some dummy information about the item. More details can be added here.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}