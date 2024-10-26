import 'dart:convert';

import '../../../home/data/models/product_response_model.dart';

class ProductModel {
  final String id;
  final String imageUrl;
  final String name;
  final String category;
  final String description;
  final double price;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
  });

  // Convert ProductModel to Map for JSON encoding
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'category': category,
      'description': description,
      'price': price,
      'rating': rating.toJson(),
    };
  }

  // Convert Map to ProductModel (for decoding)
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      category: map['category'],
      description: map['description'],
      price: map['price'].toDouble(),
      rating: Rating.fromJson(map['rating']),
    );
  }

  // Encode ProductModel to JSON
  String toJson() => json.encode(toMap());

  // Decode JSON to ProductModel
  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
