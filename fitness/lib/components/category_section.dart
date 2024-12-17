import 'package:flutter/material.dart';
import 'package:fitness/models/category_model.dart';

class CategorySection extends StatelessWidget {
  final List<Category> categories;

  const CategorySection({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((category) => _buildCategoryItem(category)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(Category category) {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: category.boxDecoration,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                category.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(category.name, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}