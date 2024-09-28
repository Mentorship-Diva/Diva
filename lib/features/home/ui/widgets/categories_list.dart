import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  // List of categories
  final List<String> categories = [
    "All",
    "Clothes",
    "Electronics",
    "Popular",
    "Category 5",
  ];
  final HomeCubit homeCubit;
  CategoriesList({super.key, required this.homeCubit});

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
              context
                  .read<HomeCubit>()
                  .selectCategory(index); // Update the selected category
            },
            child: BlocBuilder<HomeCubit, int>(
              builder: (context, selectedIndex) {
                bool isSelected = selectedIndex == index;

                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.pink
                        : Colors.pink.shade50, // Background color
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  child: Center(
                    child: Text(categories[index],
                        style: AppTextStyles.font14Weight400Black.copyWith(
                            color: isSelected
                                ? Colors.white
                                : Colors.pink, // Text color
                            fontWeight: FontWeight.bold)),
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
