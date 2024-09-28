import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/home/data/models/product.dart';

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
