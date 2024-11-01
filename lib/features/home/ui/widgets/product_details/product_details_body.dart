import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/home/data/models/product_details_model.dart';
import 'package:mentorship/features/home/ui/widgets/product_details/build_color_picker.dart';
import 'package:mentorship/features/home/ui/widgets/product_details/build_size_picker.dart';
import 'package:mentorship/features/home/ui/widgets/product_details/buy_now_bar.dart';
import 'package:mentorship/features/home/ui/widgets/product_details/image_with_buttons.dart';
import 'package:mentorship/features/home/ui/widgets/product_details/random_products_bloc_builder.dart';
import 'package:mentorship/features/home/ui/widgets/product_details/title_with_rating.dart';

import '../../../../../generated/l10n.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
    required this.product,
  });

  final ProductDetailsModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              ImageWithButtons(product: product),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWithRating(product: product),
                    SizedBox(height: 10),
                    Text(
                      "\$${product.price}",
                      style: AppTextStyles.font24BlackWeight600,
                    ),
                    SizedBox(height: 10),
                    Text(product.description),
                    SizedBox(height: 20),
                    BuildColorPicker(),
                    SizedBox(height: 20),
                    BuildSizePicker(),
                    SizedBox(height: 30),
                    Text(
                      S.of(context).youMightAlsoLike,
                      style: AppTextStyles.font18Black400,
                    ),
                    SizedBox(height: 20),
                    RandomProductsBlocBuilder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BuyNowBar(),
    );
  }
}
