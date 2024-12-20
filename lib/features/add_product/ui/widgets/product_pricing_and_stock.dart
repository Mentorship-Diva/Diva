import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubits/add_product_cubit.dart';

class ProductPricingAndStock extends StatefulWidget {
  const ProductPricingAndStock({super.key});

  @override
  State<ProductPricingAndStock> createState() => _ProductPricingAndStockState();
}

class _ProductPricingAndStockState extends State<ProductPricingAndStock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).pricingAndStock,
          style: AppTextStyles.font24BlackSemiBold,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          S.of(context).pricing,
          style: AppTextStyles.font16BlackSemiBold,
        ),
        SizedBox(
          height: 4.h,
        ),
        AppTextFormField(
          hintText: 'Ex: 180 L.E',
          controller: context.read<AddProductCubit>().productPriceController,
          borderRadius: 16.sp,
          onChanged: (value) {
            context.read<AddProductCubit>().productPriceController.text =
                value!;
          },
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          S.of(context).stock,
          style: AppTextStyles.font16BlackSemiBold,
        ),
        SizedBox(
          height: 4.h,
        ),
        AppTextFormField(
          hintText: 'Ex: 66 piece',
          controller: context.read<AddProductCubit>().productStockController,
          borderRadius: 16.sp,
          onChanged: (value) {
            context.read<AddProductCubit>().productStockController.text =
                value!;
          },
        ),
      ],
    );
  }
}
