import 'package:flutter/material.dart';

import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 4,
      itemBuilder: (context, index) {
        return CartItem();
      },
    );
  }
}
