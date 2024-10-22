import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/widgets/app_drop_down_menu.dart';
import 'package:mentorship/features/add_product/logic/cubits/add_product_cubit.dart';
import 'package:mentorship/features/add_product/ui/widgets/product_details_title_and_description.dart';

import '../../../../generated/l10n.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsTitleAndDescription(
          title: S.of(context).categories,
          description: S.of(context).pickAvailableCategories,
        ),
        AppDropDownMenu(
          hintText: context.read<AddProductCubit>().categories[0],
          onChanged: (index) {
            setState(() {
              context.read<AddProductCubit>().selectedCategory =
                  context.read<AddProductCubit>().categories[index!];
            });
          },
          values: context.read<AddProductCubit>().categories,
        ),
      ],
    );
  }
}
