import 'package:flutter/material.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/ui/widgets/banners_section.dart';
import 'package:mentorship/features/home/ui/widgets/build_categories_section.dart';
import 'package:mentorship/features/home/ui/widgets/build_products_grid_view.dart';
import 'package:mentorship/features/home/ui/widgets/home_header.dart';
import 'package:mentorship/features/home/ui/widgets/home_search_bar_with_filter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getIt<HomeCubit>().loadCategories();
    getIt<HomeCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            HomeHeader(),
            SearchBarWithFilter(),
            BannersSection(),
            BuildCategoriesList(),
            BuildProductsGridView()
          ],
        ),
      ),
    );
  }
}
