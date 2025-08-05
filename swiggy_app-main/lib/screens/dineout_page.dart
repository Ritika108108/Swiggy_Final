import 'package:flutter/material.dart';
import 'home_page.dart';

class DineoutPage extends StatefulWidget {
  const DineoutPage({super.key});

  @override
  State<DineoutPage> createState() => _DineoutPageState();

  static Widget _buildGridItem(String image, String label) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  static Widget _buildRestaurantCard({
    required String image,
    required String name,
    required String location,
    required String cuisine,
    required String price,
    required double rating,
    required String offer1,
    required String offer2,
    required int moreOffers,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          location,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          '$cuisine • $price',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.green, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.orange,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(offer1, style: TextStyle(fontSize: 12)),
                      ),
                      Text(
                        "+$moreOffers offers",
                        style: TextStyle(color: Colors.orange, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.local_offer, color: Colors.red, size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(offer2, style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _DineoutPageState extends State<DineoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Location Row
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.orange),
                    const SizedBox(width: 6),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Savitri Hostel',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Sinhagad Institute Of Technolo...',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Image.asset('assets/images/buy_one.png', height: 36),
                    const SizedBox(width: 8),
                    const CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for malls & landmarks',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Explore Dineout",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Grid Layout
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.8,
                  children: [
                    DineoutPage._buildGridItem(
                      "assets/images/cafe.jpg",
                      "Cafes",
                    ),
                    DineoutPage._buildGridItem(
                      "assets/images/buffet.jpg",
                      "Buffets",
                    ),
                    DineoutPage._buildGridItem(
                      "assets/images/rooftop.jpg",
                      "Rooftop",
                    ),
                    DineoutPage._buildGridItem(
                      "assets/images/luxury.jpg",
                      "Luxury",
                    ),
                    DineoutPage._buildGridItem(
                      "assets/images/pubs.jpg",
                      "Pubs",
                    ),
                    DineoutPage._buildGridItem(
                      "assets/images/family.jpg",
                      "Family",
                    ),
                    DineoutPage._buildGridItem(
                      "assets/images/pureveg.jpg",
                      "Pure Veg",
                    ),
                    DineoutPage._buildGridItem(
                      "assets/images/newlyopened.jpg",
                      "Newly Opened",
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Top 8 restaurants to explore",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              DineoutPage._buildRestaurantCard(
                image: 'assets/images/restaurant_1.jpg',
                name: 'Portico B4M',
                location: 'Shivaji Nagar, 6.2 km',
                cuisine: 'North Indian',
                price: '₹1300 for two',
                rating: 4.7,
                offer1: 'Flat 20% off on pre-booking',
                offer2: 'Get extra 10% off using TRYNEW',
                moreOffers: 2,
              ),
              DineoutPage._buildRestaurantCard(
                image: 'assets/images/restaurant_2.jpg',
                name: "Aroma's Hyderabad Ho...",
                location: 'Warje, 2.9 km',
                cuisine: 'Chinese',
                price: '₹1200 for two',
                rating: 4.6,
                offer1: 'Flat 10% off on walk-in',
                offer2: 'Get extra 20% off using PayPal',
                moreOffers: 1,
              ),
              DineoutPage._buildRestaurantCard(
                image: 'assets/images/restaurant_3.jpg',
                name: "Bhujbal Bhandhu",
                location: 'Warje, 2.9 km',
                cuisine: 'Chinese, North Indian',
                price: '₹900 for two',
                rating: 4.0,
                offer1: 'Flat 20% off on walk-in',
                offer2: 'Get extra 10% off using UPI',
                moreOffers: 1,
              ),
              DineoutPage._buildRestaurantCard(
                image: 'assets/images/restaurant_4.jpg',
                name: "Cafe Hashtag",
                location: 'Warje, 2.9 km',
                cuisine: 'Italian',
                price: '₹700 for two',
                rating: 4.2,
                offer1: 'Flat 10% off on walk-in',
                offer2: 'Get extra 10% off using UPI',
                moreOffers: 1,
              ),
              DineoutPage._buildRestaurantCard(
                image: 'assets/images/restaurant_5.jpg',
                name: "Laxmi Juice Bar",
                location: 'Warje, 2.9 km',
                cuisine: 'South Indian',
                price: '₹1000 for two',
                rating: 4.9,
                offer1: 'Flat 10% off on walk-in',
                offer2: 'Get extra 15% off using DINE150',
                moreOffers: 1,
              ),
              DineoutPage._buildRestaurantCard(
                image: 'assets/images/restaurant_6.jpg',
                name: "Hakuna Matata",
                location: 'Warje, 2.9 km',
                cuisine: 'Maharashtrian',
                price: '₹500 for two',
                rating: 4.8,
                offer1: 'Flat 15% off on walk-in',
                offer2: 'Get extra 10% off using DINE150',
                moreOffers: 1,
              ),
              DineoutPage._buildRestaurantCard(
                image: 'assets/images/restaurant_7.jpg',
                name: "Sky Kitchen",
                location: 'Warje, 2.9 km',
                cuisine: 'Korian',
                price: '₹1500 for two',
                rating: 4.7,
                offer1: 'Flat 10% off on walk-in',
                offer2: 'Get extra 10% off using DINE150',
                moreOffers: 1,
              ),
              DineoutPage._buildRestaurantCard(
                image: 'assets/images/restaurant_8.jpg',
                name: "Spice Garden",
                location: 'Warje, 2.9 km',
                cuisine: 'Japneese',
                price: '₹2000 for two',
                rating: 4.6,
                offer1: 'Flat 20% off on walk-in',
                offer2: 'Get extra 20% off using DINE150',
                moreOffers: 1,
              ),
            ],
          ),
        ),
      ),
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
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Dineout",
          ),
        ],
      ),
    );
  }
}
