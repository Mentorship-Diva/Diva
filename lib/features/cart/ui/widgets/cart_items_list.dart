import 'package:flutter/cupertino.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'cart_item.dart';

class CartItemsList extends StatefulWidget {
  const CartItemsList({super.key, required this.cartItems});

  final List<CartItem> cartItems;

  @override
  State<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends State<CartItemsList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: widget.cartItems.length,
      itemBuilder: (context, index) {
        final cartItem = widget.cartItems[index];
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: EdgeInsets.symmetric(horizontal: 28),
            color: AppColors.redColor,
            child: Icon(
              CupertinoIcons.delete_simple,
              color: AppColors.whiteColor,
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              widget.cartItems.removeAt(index);
            });
          },
          child: cartItem,
        );
      },
    );
  }
}
