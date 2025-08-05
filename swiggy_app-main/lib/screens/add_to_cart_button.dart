import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddToCartButton extends StatelessWidget {
  final Map<String, dynamic> foodItem;

  const AddToCartButton({super.key, required this.foodItem});

  void addToCart(BuildContext context) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final cartItem = {
      'name': foodItem['name'],
      'price': foodItem['price'],
      'image': foodItem['image'],
      'quantity': 1,
      'timestamp': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .add(cartItem);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${foodItem['name']} added to cart")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => addToCart(context),
      child: const Text("Add to Cart"),
    );
  }
}
