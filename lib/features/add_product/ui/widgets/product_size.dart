import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/add_product/logic/cubits/add_product_cubit.dart';
import 'package:mentorship/features/add_product/ui/widgets/product_details_title_and_description.dart';

class ProductSize extends StatefulWidget {
  const ProductSize({super.key});

  @override
  State<ProductSize> createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsTitleAndDescription(
          title: 'Size',
          description: 'Pick available size',
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: context.read<AddProductCubit>().sizes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  addAndRemoveSize(context: context, index: index);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context
                            .read<AddProductCubit>()
                            .selectedSizes
                            .contains(
                                context.read<AddProductCubit>().sizes[index])
                        ? AppColors.mainColor
                        : AppColors.lightPinkColor,
                  ),
                  margin: EdgeInsets.only(
                    right: 16,
                  ),
                  child: Center(
                    child: Text(
                      context.read<AddProductCubit>().sizes[index],
                      style: AppTextStyles.font16Pink400.copyWith(
                        color: context
                                .read<AddProductCubit>()
                                .selectedSizes
                                .contains(context
                                    .read<AddProductCubit>()
                                    .sizes[index])
                            ? AppColors.whiteColor
                            : AppColors.pinkColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void addAndRemoveSize({required BuildContext context, required int index}) {
    setState(() {
      if (context
          .read<AddProductCubit>()
          .selectedSizes
          .contains(context.read<AddProductCubit>().sizes[index])) {
        context
            .read<AddProductCubit>()
            .selectedSizes
            .remove(context.read<AddProductCubit>().sizes[index]);
      } else {
        context
            .read<AddProductCubit>()
            .selectedSizes
            .add(context.read<AddProductCubit>().sizes[index]);
      }
    });
  }
}
