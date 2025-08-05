import 'package:flutter/material.dart';
import 'food_page.dart';
import 'instamart_page.dart';
import 'dineout_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FoodPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InstamartPage()),
      );
    } else if (index == 3) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const DineoutPage()),
  );
}
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Location Row
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.orange),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "35/12/2",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Tukai Nagar, Kale Padal, Hadapsar, Pune, Aut...",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for 'Pizza'",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.mic, color: Colors.orange),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Expires Today!",
                          style: TextStyle(
                            color: Color(0xFF4A6CF7),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color(0xFF007BFF),
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          child: Text("SHOP ON INSTAMART"),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/banner_slot.png',
                      width: 120, // updated width
                      height: 80, // updated height
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Services Grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85, // reduced for better fit
                  children: [
                    _buildServiceCard(
                      "FOOD DELIVERY",
                      "PAY DAY SPECIAL TREATS",
                      "FLAT ₹150 OFF",
                      "assets/images/food.jpeg",
                    ),
                    _buildServiceCard(
                      "INSTAMART",
                      "GRAND FESTIVE SALE",
                      "FREE DEL AT ₹49",
                      "assets/images/instamart.png",
                    ),
                    _buildServiceCard(
                      "DINEOUT",
                      "BREAKFAST SPECIALS",
                      "UP TO 50% OFF",
                      "assets/images/dineout.jpeg",
                    ),
                    _buildServiceCard(
                      "SCENES",
                      "DISCOVER EVENTS NEARBY",
                      "NEW",
                      "assets/images/scenes.jpg",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Credit Card Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFE0B2), Colors.white],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CREDIT CARD",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "FIRST YEAR FREE, JUST FOR YOU",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("assets/images/credit_card.jpeg", height: 50),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Swiggy"),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: "Food",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Instamart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Dineout",
          ),
          
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    String title,
    String subtitle,
    String offer,
    String imagePath, {
    String? extraText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ), // added horizontal padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                offer,
                style: TextStyle(
                  fontSize: 12,
                  color: offer.toUpperCase() == "NEW"
                      ? Colors.red
                      : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (extraText != null)
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    extraText,
                    style: const TextStyle(fontSize: 10, color: Colors.orange),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
          ),
        ],
      ),
    );
  }
}
