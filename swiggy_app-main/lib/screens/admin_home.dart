import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../models/restaurant.dart';
import '../services/firestore_service.dart';

class AdminHomePage extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Sample restaurant using local asset image
            final sampleRestaurant = Restaurant(
              id: 'restaurant_001',
              name: 'Charcoal Eats',
              image: 'assets/images/pureveg.jpg',
              description: 'Delicious Indian & Fusion Meals',
              address: 'Mumbai, India',
            );

            // Sample menu items using local asset images
            final sampleMenu = [
              FoodItem(
                id: 'item_001',
                name: 'Butter Chicken Biryani',
                image: 'assets/images/food1.jpeg',
                price: 199.0,
                description: 'Rich, creamy chicken biryani with spices.',
              ),
              FoodItem(
                id: 'item_002',
                name: 'Paneer Tikka Bowl',
                image: 'assets/images/restaurant4.jpeg',
                price: 179.0,
                description: 'Smoky grilled paneer with rice and salad.',
              ),
            ];

            await _firestoreService.addRestaurantWithMenu(
              sampleRestaurant,
              sampleMenu,
            );

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sample Restaurant Uploaded!')),
            );
          },
          child: const Text("Upload Sample Restaurant"),
        ),
      ),
    );
  }
}
