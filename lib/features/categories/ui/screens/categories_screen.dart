import 'package:flutter/material.dart';
import 'package:mentorship/features/home/ui/widgets/build_categories_section.dart';
import 'package:mentorship/features/home/ui/widgets/build_products_grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [BuildCategoriesList(), BuildProductsGridView()],
          ),
        ),
      ),
    );
  }
}
