// lib/widgets/bottom_nav.dart
import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/food_page.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const FoodPage()),
        );
        break;
      // Add other cases for Bolt, High Protein, Reorder as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: (index) => _onTap(context, index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Food'),
        
      ],
    );
  }
}
