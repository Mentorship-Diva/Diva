import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import 'package:mentorship/features/add_product/logic/cubits/add_product_cubit.dart';
import 'package:mentorship/features/add_product/ui/widgets/product_details_title_and_description.dart';

class ProductColor extends StatefulWidget {
  const ProductColor({super.key});

  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsTitleAndDescription(
          title: 'Color',
          description: 'Pick available color',
        ),
        AppTextFormField(
          controller: context.read<AddProductCubit>().productColorController,
          readOnly: true,
          borderRadius: 16.sp,
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            color: AppColors.mainColor,
          ),
          onTap: () {
            ColorPicker(
              onColorChanged: (color) {
                setState(() {
                  context.read<AddProductCubit>().productColorController.text =
                      color.toString();
                });
              },
            ).showPickerDialog(context);
          },
        ),
      ],
    );
  }
}
