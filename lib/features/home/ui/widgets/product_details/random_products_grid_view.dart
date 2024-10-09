import 'package:flutter/material.dart';
import 'package:mentorship/features/home/data/models/product_response_model.dart';
import 'package:mentorship/features/home/ui/widgets/product_card.dart';

class RandomProductsGridView extends StatelessWidget {
  final List<Product> randomProducts;
  const RandomProductsGridView({super.key, required this.randomProducts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: randomProducts.length,
          itemBuilder: (context, index) {
            final product = randomProducts[index];
            return ProductCard(product: product);
          },
        ),
      ],
    );
  }
}
