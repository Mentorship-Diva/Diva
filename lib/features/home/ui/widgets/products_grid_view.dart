import 'package:flutter/material.dart';
import 'package:mentorship/features/home/data/models/product_response_model.dart';
import 'package:mentorship/features/home/ui/widgets/product_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsGridView extends StatelessWidget {
  final List<Product> products;
  final Color? heartIconColor;
  const ProductsGridView(
      {super.key, required this.products, this.heartIconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: GridView.builder(
        physics:
            const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
        shrinkWrap: true, // Let GridView take only the necessary space
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 6 / 10,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            heartIconColor: heartIconColor,
          );
        },
      ),
    );
  }
}
