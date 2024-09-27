import 'package:flutter/material.dart';
import 'package:mentorship/features/home/ui/widgets/banners_section.dart';
import 'package:mentorship/features/home/ui/widgets/build_categories_section.dart';
import 'package:mentorship/features/home/ui/widgets/build_products_grid_view.dart';
import 'package:mentorship/features/home/ui/widgets/home_header.dart';
import 'package:mentorship/features/home/ui/widgets/home_search_bar_with_filter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
