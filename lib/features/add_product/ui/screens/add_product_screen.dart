import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import '../widgets/add_product_button.dart';
import '../widgets/product_general_info.dart';
import '../widgets/product_images_section.dart';
import '../widgets/product_pricing_and_stock.dart';
import '../widgets/product_vaiants.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'Add Product',
          style: AppTextStyles.font24BlackSemiBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ProductImagesSection(),
                  ProductGeneralInfo(),
                  ProductPricingAndStock(),
                  ProductVariants(),
                ],
              ),
            ),
            AddProductButton(),
          ],
        ),
      ),
    );
  }
}
