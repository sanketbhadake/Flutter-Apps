class FavoriteCookie {
  final String name;
  final String price;
  final String imageUrl;
  
  FavoriteCookie({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  static FavoriteCookie fromMap(Map<String, dynamic> map) {
    return FavoriteCookie(
      name: map['name'],
      price: map['price'],
      imageUrl: map['imageUrl'],
    );
  }
}
