import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/ui/widgets/banners_section.dart';
import 'package:mentorship/features/home/ui/widgets/categories_list.dart';
import 'package:mentorship/features/home/ui/widgets/home_header.dart';
import 'package:mentorship/features/home/ui/widgets/home_search_bar_with_filter.dart';
import 'package:mentorship/features/home/ui/widgets/products_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            const HomeHeader(),
            const SearchBarWithFilter(),
            const BannersSection(),
            CategoriesList(
              homeCubit: context.read<HomeCubit>(),
            ),
            ProductsGridView(),
          ],
        ),
      ),
    );
  }
}
