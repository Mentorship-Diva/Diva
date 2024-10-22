import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/features/add_product/ui/widgets/product_category.dart';
import 'package:mentorship/features/add_product/ui/widgets/product_color.dart';
import 'package:mentorship/features/add_product/ui/widgets/product_name_and_description.dart';
import 'package:mentorship/features/add_product/ui/widgets/product_size.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class ProductGeneralInfo extends StatelessWidget {
  const ProductGeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).generalInfo,
          style: AppTextStyles.font24BlackSemiBold,
        ),
        SizedBox(
          height: 4.h,
        ),
        ProductNameAndDescription(),
        SizedBox(
          height: 16.h,
        ),
        ProductSize(),
        SizedBox(
          height: 16.h,
        ),
        ProductColor(),
        SizedBox(
          height: 16.h,
        ),
        ProductCategory(),
      ],
    );
  }
}
