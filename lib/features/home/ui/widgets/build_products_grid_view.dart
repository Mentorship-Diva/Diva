import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/logic/home_state.dart';
import 'package:mentorship/features/home/ui/screens/product_details_screen.dart';
import 'package:mentorship/features/home/ui/widgets/products_grid_view.dart';
import 'package:mentorship/features/home/ui/widgets/shimmer_products_grid_view.dart';

class BuildProductsGridView extends StatelessWidget {
  const BuildProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) => current is NavigateToProductDetails,
      listener: (context, state) {
        if (state is NavigateToProductDetails) {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                productId: state.productId,
                homeCubit: getIt<HomeCubit>(),
              ),
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is HomeProductsLoading ||
          current is HomeProductsError ||
          current is HomeProductsSuccess,
      builder: (context, state) {
        // Logging the current state
        print('Current state: $state');

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
