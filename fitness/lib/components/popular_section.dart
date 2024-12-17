import 'package:flutter/material.dart';
// import 'package:fitness/models/category_model.dart';
import 'package:fitness/pages/item_info_page.dart';
import 'package:fitness/models/popular_categories.dart'; // Add this line to import the PopularCategory type

class PopularSection extends StatelessWidget {
  final List<PopularCategory> popularCategories;

  const PopularSection({Key? key, required this.popularCategories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children: popularCategories.map((popularCategory) => _buildPopularCategoryItem(context, popularCategory)).toList(),
        ),
      ],
    );
  }

  Widget _buildPopularCategoryItem(BuildContext context, PopularCategory popularCategory) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: popularCategory.boxDecoration,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              popularCategory.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(popularCategory.name, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemInfoPage(popularCategory: popularCategory),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}