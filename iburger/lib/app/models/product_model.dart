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

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id']?.toInt() ?? 0,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        price: json['price']?.toDouble() ?? 0.0,
        image: json['image'] ?? '',
      );

  Map<String, dynamic> get toJson => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'image': image,
      };
}
