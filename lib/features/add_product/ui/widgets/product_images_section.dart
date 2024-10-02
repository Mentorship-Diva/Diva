import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles.dart';

class ProductImagesSection extends StatelessWidget {
  const ProductImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Product Images',
              style: AppTextStyles.font24BlackSemiBold,
            ),
            SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: (){},
              child: Icon(
                Icons.info_outline_rounded,
                size: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
