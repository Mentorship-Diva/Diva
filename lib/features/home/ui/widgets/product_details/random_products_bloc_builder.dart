import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/logic/home_state.dart';
import 'package:mentorship/features/home/ui/widgets/product_details/random_products_grid_view.dart';

class RandomProductsBlocBuilder extends StatelessWidget {
  const RandomProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is RandomProcutsLoading ||
          current is RandomProcutsSuccess ||
          current is RandomProcutsError,
      builder: (context, state) {
        return state.whenOrNull(
              randomProductsLoading: () {
                return const Center(child: CircularProgressIndicator());
              },
              randomProductsSuccess: (randomProducts) {
                return RandomProductsGridView(randomProducts: randomProducts);
              },
              randomProductsError: (message) {
                return Center(child: Text(message));
              },
            ) ??
            SizedBox();
      },
    );
  }
}
