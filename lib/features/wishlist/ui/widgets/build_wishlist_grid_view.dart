import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/features/home/data/models/product_response_model.dart';
import 'package:mentorship/features/wishlist/logic/cubit/wishlist_cubit.dart';
import 'package:mentorship/features/wishlist/logic/cubit/wishlist_state.dart';
import 'package:mentorship/features/home/ui/widgets/products_grid_view.dart';

class BuildWishlistItemsGridView extends StatelessWidget {
  const BuildWishlistItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<WishlistCubit>(),
      child: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          log(state.toString());
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (wishlist) {
              if (wishlist.isEmpty) {
                return const Center(
                  child: Text(
                    'Your wishlist is empty!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                );
              }

              return ProductsGridView(
                products: wishlist
                    .map((item) => Product(
                          id: int.parse(item.id),
                          title: item.name,
                          price: item.price,
                          description: item.description,
                          category: item.category,
                          image: item.imageUrl,
                          rating: item.rating,
                        ))
                    .toList(),
                heartIconColor: Colors.red,
              );
            },
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}
