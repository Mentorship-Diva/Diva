import 'package:flutter/material.dart';
import 'package:mentorship/features/add_product/ui/widgets/product_details_title_and_description.dart';

class ProductSize extends StatelessWidget {
  const ProductSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsTitleAndDescription(
          title: 'Size',
          description: 'Pick available size',
        ),
      ],
    );
  }
}
