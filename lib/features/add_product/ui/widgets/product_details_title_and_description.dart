import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles.dart';

class ProductDetailsTitleAndDescription extends StatelessWidget {
  const ProductDetailsTitleAndDescription({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.font16BlackSemiBold,
        ),
        Text(
          description,
          style: AppTextStyles.font12DarkGrey400,
        ),
      ],
    );
  }
}
