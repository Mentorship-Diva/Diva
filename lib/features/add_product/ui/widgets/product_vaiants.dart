import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles.dart';

class ProductVariants extends StatelessWidget {
  const ProductVariants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Variants',
          style: AppTextStyles.font24BlackSemiBold,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'No variants yes',
              style: AppTextStyles.font14WeightBoldBlack,
            ),
            GestureDetector(
              onTap: (){
                // TODO: Add variants
              },
              child: Text(
                'Add one',
                style: AppTextStyles.font14Pink400UnderLine,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
