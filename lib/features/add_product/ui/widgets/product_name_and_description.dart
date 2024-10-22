import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import 'package:mentorship/features/add_product/logic/cubits/add_product_cubit.dart';

import '../../../../generated/l10n.dart';

class ProductNameAndDescription extends StatefulWidget {
  const ProductNameAndDescription({super.key});

  @override
  State<ProductNameAndDescription> createState() =>
      _ProductNameAndDescriptionState();
}

class _ProductNameAndDescriptionState extends State<ProductNameAndDescription> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).productName,
          style: AppTextStyles.font16BlackSemiBold,
        ),
        SizedBox(
          height: 4.h,
        ),
        AppTextFormField(
          controller: context.read<AddProductCubit>().productNameController,
          hintText: 'Ex: wrapped dress',
          borderRadius: 16.sp,
          onChanged: (value) {
            setState(() {
              context.read<AddProductCubit>().productNameController.text =
                  value!;
            });
          },
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          S.of(context).productDescription,
          style: AppTextStyles.font16BlackSemiBold,
        ),
        SizedBox(
          height: 4.h,
        ),
        AppTextFormField(
          controller:
              context.read<AddProductCubit>().productDescriptionController,
          hintText: 'Ex: long italian silky dress wrapped waist bla bla bla ',
          borderRadius: 16.sp,
          minLines: 4,
          maxLines: 6,
          onChanged: (value) {
            setState(() {
              context
                  .read<AddProductCubit>()
                  .productDescriptionController
                  .text = value!;
            });
          },
        ),
      ],
    );
  }
}
