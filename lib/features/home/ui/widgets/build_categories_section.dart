import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/logic/home_state.dart';
import 'package:mentorship/features/home/ui/widgets/categories_list.dart';
import 'package:mentorship/features/home/ui/widgets/shimmer_categories_list.dart';

class BuildCategoriesList extends StatelessWidget {
  const BuildCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = getIt<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeCategoriesSuccess ||
          current is HomeCategoriesError ||
          current is HomeCategoriesLoading,
      builder: (context, state) {
        if (state is HomeCategoriesLoading) {
          return const ShimmerCategoriesList();
        } else if (state is HomeCategoriesError) {
          return Center(child: Text(state.message));
        } else if (state is HomeCategoriesSuccess) {
          final categories = state.categories;
          return CategoriesList(
            categories: categories,
            homeCubit: homeCubit,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
