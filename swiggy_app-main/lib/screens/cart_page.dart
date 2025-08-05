import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<dynamic> cartItems = [];
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    final response = await http.get(Uri.parse('http://<your-ip>:5000/cart'));
    if (response.statusCode == 200) {
      setState(() {
        cartItems = json.decode(response.body);
        calculateTotal();
      });
    } else {
      print('Failed to load cart');
    }
  }

  void calculateTotal() {
    total = 0.0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
  }

  Future<void> removeItem(String itemId) async {
    final response = await http.delete(Uri.parse('http://<your-ip>:5000/cart/$itemId'));
    if (response.statusCode == 200) {
      fetchCartItems();
    }
  }

  Widget buildCartItem(item) {
    return ListTile(
      leading: Image.network(item['image'], width: 50),
      title: Text(item['name']),
      subtitle: Text('₹${item['price']} x ${item['quantity']}'),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => removeItem(item['_id']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) => buildCartItem(cartItems[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: ₹$total", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {
                    // You can implement checkout logic later
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Checkout not implemented')));
                  },
                  child: Text("Checkout"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
