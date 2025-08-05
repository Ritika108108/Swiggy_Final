// lib/services/search_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> searchFoodItems(String query) async {
    if (query.isEmpty) return [];

    final snapshot = await _firestore
        .collection('food_items')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> searchRestaurants(String query) async {
    if (query.isEmpty) return [];

    final snapshot = await _firestore
        .collection('restaurants')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
