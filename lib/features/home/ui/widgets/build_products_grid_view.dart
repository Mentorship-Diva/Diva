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
          current is HomeProductsLoading ||
          current is HomeProductsError ||
          current is HomeProductsSuccess,
      builder: (context, state) {
        return state.whenOrNull(
              // Loading state
              productsLoading: () {
                return const ShimmerProductsGridView();
              },
              // Error state
              productsError: (message) {
                return Center(child: Text(message));
              },
              // Success state
              productsSuccess: (products, selectedCategory) {
                return ProductsGridView(products: products);
              },
            ) ??
            const SizedBox();
      },
    );
  }
}
