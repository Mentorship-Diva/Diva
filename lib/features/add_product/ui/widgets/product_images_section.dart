import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/features/add_product/logic/cubits/add_product_cubit.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class ProductImagesSection extends StatefulWidget {
  const ProductImagesSection({super.key});

  @override
  State<ProductImagesSection> createState() => _ProductImagesSectionState();
}

class _ProductImagesSectionState extends State<ProductImagesSection> {
  @override
  Widget build(BuildContext context) {
    double height = 90;
    double width = context.screenWidth / 3.9;
    return Column(
      children: [
        Row(
          children: [
            Text(
              S.of(context).productImages,
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
                  child: GestureDetector(
                    onTap: () {
                      pickImage(index);
                    },
                    child: context
                                .read<AddProductCubit>()
                                .selectedImages[index] ==
                            null
                        ? Container(
                            height: height,
                            width: width,
                            decoration: BoxDecoration(
                              color: AppColors.lightBlueColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 5),
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
                                  S.of(context).clickToUploadImage,
                                  style: AppTextStyles.font12Blue400UnderLine,
                                ),
                              ],
                            ))
                        : Image.file(
                            context
                                .read<AddProductCubit>()
                                .selectedImages[index]!,
                            fit: BoxFit.fill,
                            height: height,
                            width: width,
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

  Future<void> pickImage(int index) async {
    final XFile? image = await context
        .read<AddProductCubit>()
        .picker
        .pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        context.read<AddProductCubit>().selectedImages[index] =
            File(image.path);
      });
    }
  }
}
