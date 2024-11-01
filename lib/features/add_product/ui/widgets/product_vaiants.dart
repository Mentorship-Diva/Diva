import 'package:flutter/material.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class ProductVariants extends StatelessWidget {
  const ProductVariants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).variants,
          style: AppTextStyles.font24BlackSemiBold,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).noVariantsYet,
              style: AppTextStyles.font14WeightBoldBlack,
            ),
            GestureDetector(
              onTap: (){
                // TODO: Add variants
              },
              child: Text(
                S.of(context).addOne,
                style: AppTextStyles.font14Pink400UnderLine,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
