import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurant.dart';
import '../models/food_item.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addRestaurantWithMenu(Restaurant restaurant, List<FoodItem> menu) async {
    final restaurantRef = _db.collection('restaurants').doc(restaurant.id);

    await restaurantRef.set(restaurant.toMap());

    for (final foodItem in menu) {
      await restaurantRef.collection('menu').doc(foodItem.id).set(foodItem.toMap());
    }
  }

  Future<List<FoodItem>> getMenuForRestaurant(String restaurantId) async {
    final snapshot = await _db
        .collection('restaurants')
        .doc(restaurantId)
        .collection('menu')
        .get();

    return snapshot.docs.map((doc) => FoodItem.fromMap(doc.data())).toList();
  }
}
