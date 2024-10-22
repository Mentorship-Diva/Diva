import 'package:flutter/material.dart';
import 'package:mentorship/features/home/ui/widgets/banners_section.dart';
import 'package:mentorship/features/home/ui/widgets/build_categories_section.dart';
import 'package:mentorship/features/home/ui/widgets/build_products_grid_view.dart';
import 'package:mentorship/features/home/ui/widgets/home_header.dart';
import 'package:mentorship/features/home/ui/widgets/home_search_bar_with_filter.dart';

import '../../../../core/Localization/localization_cubit.dart';
import '../../../../core/di/dependency_injection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      getIt<LocalizationCubit>().chooseEnglishLanguage();
                      // context.pushAndRemoveUtilsNamed(Routes.splashScreen);
                    },
                    child: Text('ENGLISH'),
                  ),
                  GestureDetector(
                    onTap: (){
                      getIt<LocalizationCubit>().chooseArabicLanguage();
                      // context.pushAndRemoveUtilsNamed(Routes.splashScreen);
                    },
                    child: Text('ARABIC'),
                  ),
                ],
              ),


              HomeHeader(),
              SearchBarWithFilter(),
              BannersSection(),
              BuildCategoriesList(),
              BuildProductsGridView()
            ],
          ),
        ),
      ),
    );
  }
}
