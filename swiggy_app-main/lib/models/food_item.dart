class FoodItem {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;

  FoodItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
    };
  }

  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      description: map['description'] ?? '',
    );
  }
}
