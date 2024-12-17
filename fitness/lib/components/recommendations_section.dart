import 'package:flutter/material.dart';
import 'package:fitness/models/category_model.dart';

class RecommendationsSection extends StatelessWidget {
  final List<Category> recommendations;

  const RecommendationsSection({Key? key, required this.recommendations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommendations',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: recommendations.map((recommendation) => _buildRecommendationItem(recommendation)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendationItem(Category category) {
    return Container(
      width: 150,
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
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            child: const Text('Order Now'),
          ),
        ],
      ),
    );
  }
}