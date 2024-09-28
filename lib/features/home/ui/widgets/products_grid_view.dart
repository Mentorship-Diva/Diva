import 'package:flutter/material.dart';
import 'package:mentorship/features/home/data/models/product.dart';
import 'package:mentorship/features/home/ui/widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  // Sample product list
  final List<Product> products = [
    Product(
        imageUrl: 'assets/images/product.jpg', name: 'Product 1', price: 10.0),
    Product(
        imageUrl: 'assets/images/product.jpg', name: 'Product 2', price: 15.0),
    Product(
        imageUrl: 'assets/images/product.jpg', name: 'Product 3', price: 20.0),
    Product(
        imageUrl: 'assets/images/product.jpg', name: 'Product 4', price: 25.0),
    // Add more products as needed
  ];

  ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: GridView.builder(
        physics:
            const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
        shrinkWrap: true, // Let GridView take only the necessary space
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 6 / 9,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
