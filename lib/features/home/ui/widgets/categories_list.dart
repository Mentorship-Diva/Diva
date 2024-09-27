import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/features/home/logic/home_state.dart';

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
                final isSelected = (state is HomeProdcutsSuccess &&
                    state.selectedCategory == categories[index]);
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.pink : Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: AppTextStyles.font14Weight400Black.copyWith(
                        color: isSelected ? Colors.white : Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
