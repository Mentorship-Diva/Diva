import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/features/home/logic/home_state.dart';
import 'package:mentorship/features/home/ui/widgets/category.dart';

class CategoriesList extends StatelessWidget {
  final HomeCubit homeCubit;
  final List<String> categories;

  const CategoriesList({
    super.key,
    required this.homeCubit,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 20.w, top: 15.h),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              homeCubit.loadCategoryProducts(categories[index]);
            },
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final isSelected = (state is HomeProductsSuccess &&
                    state.selectedCategory == categories[index]);
                return Category(
                    isSelected: isSelected, category: categories[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
