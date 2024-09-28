import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/logic/home_state.dart';
import 'package:mentorship/features/home/ui/widgets/products_grid_view.dart';
import 'package:mentorship/features/home/ui/widgets/shimmer_products_grid_view.dart';

class BuildProductsGridView extends StatelessWidget {
  const BuildProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeProdcutsSuccess ||
          current is HomeProdcutsError ||
          current is HomeProdcutsLoading,
      builder: (context, state) {
        if (state is HomeProdcutsLoading) {
          return const ShimmerProductsGridView();
        } else if (state is HomeProdcutsError) {
          return Center(child: Text(state.message));
        } else if (state is HomeProdcutsSuccess) {
          final products = state.products;
          return ProductsGridView(
            products: products,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
