import 'food_item.dart';

class Restaurant {
  final String id;
  final String name;
  final String image;
  final String description;
  final String address;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'address': address,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      address: map['address'] ?? '',
    );
  }
}
