import 'package:flutter/material.dart';
import 'package:mentorship/features/wishlist/ui/widgets/build_wishlist_grid_view.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [BuildWishlistItemsGridView()],
          ),
        ),
      ),
    );
  }
}
