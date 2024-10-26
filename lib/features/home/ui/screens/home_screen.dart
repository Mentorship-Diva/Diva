import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeHeader(),
              SearchBarWithFilter(),
              SizedBox(
                height: 16,
              ),
              BannersSection(),
              SizedBox(
                height: 12,
              ),
              BuildCategoriesList(),
              SizedBox(
                height: 16,
              ),
              BuildProductsGridView()
            ],
          ),
        ),
      ),
    );
  }
}
