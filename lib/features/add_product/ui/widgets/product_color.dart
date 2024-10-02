import 'package:flutter/material.dart';
import 'package:mentorship/features/add_product/ui/widgets/product_details_title_and_description.dart';

import '../../../../core/theming/text_styles.dart';

class ProductColor extends StatelessWidget {
  const ProductColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsTitleAndDescription(
          title: 'Color',
          description: 'Pick available color',
        ),
      ],
    );
  }
}