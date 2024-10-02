import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/widgets/diva_loading_indicator.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/logic/home_state.dart';
import 'package:mentorship/features/home/ui/widgets/product_details/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;
  final HomeCubit homeCubit;

  const ProductDetailsScreen({
    Key? key,
    required this.productId,
    required this.homeCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: homeCubit
          ..loadProductDetails(productId.toString())
          ..loadRandomProducts(6),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is HomeProductDetailsError ||
              current is HomeProductDetailsSuccess ||
              current is HomeProductDetailsLoading,
          builder: (context, state) {
            final isLoading = state is HomeProductDetailsLoading ||
                state is RandomProcutsLoading;
            if (isLoading) {
              return const Center(child: DivaLoadingIndicator());
            }
            return state.whenOrNull(
                  productDetailsLoading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  productDetailsSuccess: (product) {
                    return ProductDetailsBody(product: product);
                  },
                  randomProductsError: (message) {
                    return Center(child: Text(message));
                  },
                ) ??
                const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
