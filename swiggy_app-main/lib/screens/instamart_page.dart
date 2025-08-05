import 'package:flutter/material.dart';
import 'home_page.dart';

class InstamartPage extends StatelessWidget {
  const InstamartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Delivery Info
              Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.timer, color: Colors.white, size: 18),
                        const SizedBox(width: 6),
                        const Expanded(
                          child: Text(
                            "16 MINS Delivery to Sprintofy Tech...",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.blue),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Tukai Nagar, Kale Padal....",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(height: 12),
                    // Search Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search for 'Papad'",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Icon(Icons.qr_code_scanner, color: Colors.grey),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Categories
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Expiry Banner
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFD3E7F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.blue),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "EXPIRES IN 6 Hours",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Hurry! Claim your ₹100 FREE cash now!\nOn your first order above ₹299. T&C applied",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/cashback.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Hot Deals Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Hot deals",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("See All", style: TextStyle(color: Colors.orange)),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Horizontal Scrollable Product Cards (First Row)
              SizedBox(
                height: 240,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      SizedBox(width: 12),
                      ProductTile(
                        image: 'assets/images/amul_dahi.jpg',
                        name: 'Amul Masti Dahi',
                        weight: '390 g',
                        price: 35,
                        timer: '6 MINS',
                      ),
                      SizedBox(width: 12),
                      ProductTile(
                        image: 'assets/images/potato.jpg',
                        name: 'Potato (Batate)',
                        weight: '1 kg',
                        price: 38,
                        originalPrice: 48,
                        discount: '20% OFF',
                        timer: '6 MINS',
                      ),
                      SizedBox(width: 12),
                      ProductTile(
                        image: 'assets/images/coriander.jpg',
                        name: 'Coriander with Roots',
                        weight: '1 Bunch',
                        price: 15,
                        originalPrice: 19,
                        discount: '21% OFF',
                        timer: '6 MINS',
                      ),
                      SizedBox(width: 12),
                      ProductTile(
                        image: 'assets/images/gemini.png',
                        name: 'Gemini Oil',
                        weight: '1 kg',
                        price: 280,
                        originalPrice: 34,
                        discount: '18% OFF',
                        timer: '6 MINS',
                      ),
                      SizedBox(width: 12),
                      ProductTile(
                        image: 'assets/images/chocobake.png',
                        name: 'Chocobake',
                        weight: '20 g',
                        price: 30,
                        originalPrice: 39,
                        discount: '23% OFF',
                        timer: '6 MINS',
                      ),
                      SizedBox(width: 12),
                      ProductTile(
                        image: 'assets/images/bread.jpg',
                        name: 'Brown Bread',
                        weight: '400 g',
                        price: 25,
                        timer: '6 MINS',
                      ),
                      SizedBox(width: 12),
                      ProductTile(
                        image: 'assets/images/milk.jpg',
                        name: 'Toned Milk',
                        weight: '1 L',
                        price: 52,
                        timer: '6 MINS',
                      ),
                      SizedBox(width: 12),
                      ProductTile(
                        image: 'assets/images/tomato.jpg',
                        name: 'Tomato',
                        weight: '1 Kg',
                        price: 20,
                        originalPrice: 40,
                        discount: '20% OFF',
                        timer: '6 MINS',
                      ),
                      SizedBox(width: 12),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Grocery & Kitchen",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  children: const [
                    CategoryCard(
                      "Fresh\nVegetables",
                      "assets/images/fresh_vegetables.jpg",
                    ),
                    CategoryCard(
                      "Fresh\nFruits",
                      "assets/images/fresh_fruits.jpg",
                    ),
                    CategoryCard(
                      "Dairy, Bread\nand Eggs",
                      "assets/images/dairy.jpg",
                    ),
                    CategoryCard(
                      "Cereals and\nBreakfast",
                      "assets/images/cereals.jpg",
                    ),
                    CategoryCard(
                      "Atta, Rice\nand Dal",
                      "assets/images/atta.jpg",
                    ),
                    CategoryCard("Oils and\nGhee", "assets/images/oil.jpg"),
                    CategoryCard("Masalas", "assets/images/masala.jpg"),
                    CategoryCard(
                      "Dry Fruits\nand Seeds",
                      "assets/images/dryfruits.jpg",
                    ),
                    CategoryCard(
                      "Biscuits and\nCookies",
                      "assets/images/biscuits.jpg",
                    ),
                    CategoryCard(
                      "Tea, Coffee\nand Milk",
                      "assets/images/tea.jpg",
                    ),
                    CategoryCard(
                      "Sauces and\nSpreads",
                      "assets/images/sauce.jpg",
                    ),
                    CategoryCard("Meat and\nSeafood", "assets/images/meat.jpg"),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
          // Already on Instamart, no action needed if index == 1
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Instamart',
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String label;
  final String image;

  const CategoryCard(this.label, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

// Category Icon Widget
class CategoryIcon extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryIcon({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

// Product Tile Widget
class ProductTile extends StatelessWidget {
  final String image;
  final String name;
  final String weight;
  final double price;
  final double? originalPrice;
  final String? discount;
  final String timer;

  const ProductTile({
    super.key,
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
    this.originalPrice,
    this.discount,
    required this.timer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orange.shade100),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.shade50,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  image,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14,
                  child: Icon(Icons.add, size: 18, color: Colors.green),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              weight,
              style: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timer,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
                const SizedBox(height: 2),
                Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                if (discount != null)
                  Text(
                    discount!,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Row(
                  children: [
                    Text(
                      '₹${price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    if (originalPrice != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          '₹${originalPrice!.toStringAsFixed(0)}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
