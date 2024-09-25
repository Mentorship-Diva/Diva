import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/text_styles.dart';

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

class Product {
  final String imageUrl;
  final String name;
  final double price;

  Product({required this.imageUrl, required this.name, required this.price});
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Product Image with rounded corners
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Product Name
            Text(
              product.name,
              style: AppTextStyles.font14Weight400Grey,
            ),
            // Product Price
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: AppTextStyles.font14WeightBoldBlack,
            ),
          ],
        ),
        // Favorite Icon (top-left)
        Positioned(
          top: 10,
          left: 10,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.8),
            child: IconButton(
              icon: const Icon(Icons.favorite_border),
              color: Colors.black,
              onPressed: () {
                // Add favorite functionality
              },
            ),
          ),
        ),
        // Add to Cart Icon (bottom-right)
        Positioned(
          bottom: 60,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.8),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.black,
              onPressed: () {
                // Add to cart functionality
              },
            ),
          ),
        ),
      ],
    );
  }
}
