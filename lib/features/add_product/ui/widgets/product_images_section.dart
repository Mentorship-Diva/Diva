import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';

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
              onTap: () {},
              child: Icon(
                Icons.info_outline_rounded,
                size: 18,
              ),
            ),
          ],
        ),
        Row(
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                strokeWidth: .6,
                color: AppColors.lightGreyColor,
                dashPattern: [8, 4],
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightBlueColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.addImage,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Click to upload',
                          style: AppTextStyles.font12Blue400UnderLine,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
