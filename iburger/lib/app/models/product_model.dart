import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        price: map['price']?.toDouble() ?? 0.0,
        image: map['image'] ?? '',
      );

  Map<String, dynamic> get toMap => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'image': image,
      };

  factory ProductModel.fromJson(String json) => ProductModel.fromMap(
        jsonDecode(json),
      );

  String get toJson => jsonEncode(toMap);
}
