import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';

class SearchBarWithFilter extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchBarWithFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Search bar
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged: (query) {
                // Trigger search when the query changes
                context.read<HomeCubit>().searchProducts(query);
              },
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),
                  child: SvgPicture.asset(
                    "assets/svgs/search.svg",
                    width: 25.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.pinkColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                prefixIconConstraints: BoxConstraints(minWidth: 30.w),
                hintText: 'Search here',
                hintStyle: AppTextStyles.font14Weight400FadedBlack,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 25.w,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10), // Space between search bar and filter icon
          CircleAvatar(
            backgroundColor: AppColors.pinkColor.withOpacity(0.15),
            radius: 24,
            child: SvgPicture.asset(
              "assets/svgs/filter.svg",
              width: 22.w,
              colorFilter: const ColorFilter.mode(
                AppColors.pinkColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
