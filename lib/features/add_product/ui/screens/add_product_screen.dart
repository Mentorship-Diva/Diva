import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import '../../logic/cubits/add_product_cubit.dart';
import '../widgets/add_product_button.dart';
import '../widgets/product_general_info.dart';
import '../widgets/product_images_section.dart';
import '../widgets/product_pricing_and_stock.dart';
import '../widgets/product_vaiants.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  @override
  void initState() {
    super.initState();
    context.read<AddProductCubit>().productNameController =
        TextEditingController();
    context.read<AddProductCubit>().productDescriptionController =
        TextEditingController();
    context.read<AddProductCubit>().productPriceController =
        TextEditingController();
    context.read<AddProductCubit>().productStockController =
        TextEditingController();
  }
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: ProductPricingAndStock(),
                  ),
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
