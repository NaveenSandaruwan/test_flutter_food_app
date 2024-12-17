import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/popular_categories.dart';
import 'package:fitness/models/search_item_model.dart';
// import 'package:fitness/models/search_item_model.dart';
import 'item_info_page.dart';
import 'package:fitness/components/category_section.dart';
import 'package:fitness/components/recommendations_section.dart';
import 'package:fitness/components/popular_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<SearchItem> _filteredSearchItems = [];
  List<Category> categories = [];
  List<PopularCategory> popularCategories = [];
  List<Category> recommendations = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchPopularCategories();
    fetchRecommendations();
    fetchSearchItems();
  }

  Future<void> fetchCategories() async {
    try {
      final fetchedCategories = await CategoryService.fetchCategories();
      setState(() {
        categories = fetchedCategories;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchPopularCategories() async {
    try {
      final fetchedPopularCategories = await PopularCategoryService.fetchPopularCategories();
      setState(() {
        popularCategories = fetchedPopularCategories;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchRecommendations() async {
    try {
      final fetchedRecommendations = await CategoryService.fetchRecommendations();
      setState(() {
        recommendations = fetchedRecommendations;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchSearchItems() async {
    try {
      final fetchedSearchItems = await SearchItemService.fetchSearchItems();
      setState(() {
        _filteredSearchItems = fetchedSearchItems;
      });
    } catch (e) {
      print(e);
    }
  }

  void _filterSearchItems(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredSearchItems = [];
      });
      return;
    }

    setState(() {
      _filteredSearchItems = _filteredSearchItems
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breakfast'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Color.fromARGB(255, 69, 134, 247),
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 242, 242),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 242, 242),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.more_vert),
              color: Colors.black,
              onPressed: () {
                // Add your onPressed code here!
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset('assets/filter.svg'),
                          ),
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      ),
                      onChanged: _filterSearchItems,
                    ),
                    if (_filteredSearchItems.isNotEmpty)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _filteredSearchItems.length,
                          itemBuilder: (context, index) {
                            final item = _filteredSearchItems[index];
                            return ListTile(
                              leading: Image.asset(item.imagePath, width: 50, height: 50, fit: BoxFit.cover),
                              title: Text(item.name),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemInfoPage(
                                      popularCategory: PopularCategory(
                                        id: item.id,
                                        imagePath: item.imagePath,
                                        name: item.name,
                                        backgroundColor: item.backgroundColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CategorySection(categories: categories),
              const SizedBox(height: 20),
              RecommendationsSection(recommendations: recommendations),
              const SizedBox(height: 20),
              PopularSection(popularCategories: popularCategories),
            ],
          ),
        ),
      ),
    );
  }
}