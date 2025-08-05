// lib/screens/cart_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get userId => _auth.currentUser!.uid;

  // ADD TO CART
  Future<void> addToCart(String userId, Map<String, dynamic> item) async {
  final cartRef = FirebaseFirestore.instance.collection('cart').doc(userId);

  final doc = await cartRef.get();
  if (doc.exists) {
    List<dynamic> items = doc['items'] ?? [];

    // Check if item already exists
    int index = items.indexWhere((i) => i['id'] == item['id']);
    if (index != -1) {
      items[index]['quantity'] += 1;
    } else {
      item['quantity'] = 1;
      items.add(item);
    }

    await cartRef.update({'items': items});
  } else {
    item['quantity'] = 1;
    await cartRef.set({'items': [item]});
  }
}

  // REMOVE FROM CART
  Future<void> removeFromCart(String itemId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(itemId)
        .delete();
  }

  // GET CART ITEMS
  Stream<List<Map<String, dynamic>>> getCartItems() {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => doc.data()).toList());
  }

  // PLACE ORDER
  Future<void> placeOrder(List<Map<String, dynamic>> items) async {
    double total = 0;
    for (var item in items) {
      total += item['price'] * item['quantity'];
    }

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('orders')
        .add({
      'items': items,
      'total': total,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Clear cart
    final cartRef = _firestore.collection('users').doc(userId).collection('cart');
    final snapshot = await cartRef.get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }
}
