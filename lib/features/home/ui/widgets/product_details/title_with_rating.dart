import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/home/data/models/product_details_model.dart';

class TitleWithRating extends StatelessWidget {
  const TitleWithRating({
    super.key,
    required this.product,
  });

  final ProductDetailsModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.8,
          child: Text(
            product.title,
            style: AppTextStyles.font16BlackWeight400,
            maxLines: 1,
          ),
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            Text('${product.rating.rate} (${product.rating.count} reviews)'),
          ],
        ),
      ],
    );
  }
}
