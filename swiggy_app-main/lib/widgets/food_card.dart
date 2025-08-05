import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;

  const FoodCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 3,
      child: ListTile(
        leading: Image.network(foodItem.image, width: 60, height: 60, fit: BoxFit.cover),
        title: Text(foodItem.name),
        subtitle: Text("₹${foodItem.price.toStringAsFixed(0)}"),
      ),
    );
  }
}
