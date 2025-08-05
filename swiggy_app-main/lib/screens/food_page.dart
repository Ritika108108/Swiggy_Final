import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_item.dart';
import '../widgets/food_card.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  String searchQuery = '';
  String selectedCategory = 'All';
  String priceSortOrder = 'none';

  List<String> categories = [
    'All',
    'Pizza',
    'Burger',
    'Dessert',
    'South Indian',
    'Chinese'
  ];

  @override
  Widget build(BuildContext context) {
    Query<Map<String, dynamic>> foodQuery =
        FirebaseFirestore.instance.collection('food_items');

    if (searchQuery.isNotEmpty) {
      foodQuery = foodQuery.where(
        'keywords',
        arrayContains: searchQuery.toLowerCase(),
      );
    }

    if (selectedCategory != 'All') {
      foodQuery = foodQuery.where('category', isEqualTo: selectedCategory);
    }

    if (priceSortOrder == 'asc') {
      foodQuery = foodQuery.orderBy('price', descending: false);
    } else if (priceSortOrder == 'desc') {
      foodQuery = foodQuery.orderBy('price', descending: true);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Menu'),
        backgroundColor: Colors.orange,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                priceSortOrder = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'asc',
                child: Text('Sort by Price: Low to High'),
              ),
              const PopupMenuItem(
                value: 'desc',
                child: Text('Sort by Price: High to Low'),
              ),
              const PopupMenuItem(
                value: 'none',
                child: Text('Clear Sorting'),
              ),
            ],
            icon: const Icon(Icons.filter_list),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search food...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.trim();
                    });
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      final isSelected = selectedCategory == cat;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(cat),
                          selected: isSelected,
                          onSelected: (_) {
                            setState(() {
                              selectedCategory = cat;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: foodQuery.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading food items'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final foodDocs = snapshot.data!.docs;

          if (foodDocs.isEmpty) {
            return const Center(child: Text('No food items found'));
          }

          return ListView.builder(
            itemCount: foodDocs.length,
            itemBuilder: (context, index) {
              final food = foodDocs[index].data();
              final foodItem = FoodItem.fromMap(food); // <-- Make sure to use .fromMap

              return FoodCard(foodItem: foodItem); // <-- Make sure food_card.dart uses foodItem as param
            },
          );
        },
      ),
    );
  }
}
