import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../logic/cart_cubit.dart';
import 'cart_item.dart';

class CartItemsList extends StatefulWidget {
  const CartItemsList({super.key});

  @override
  State<CartItemsList> createState() => _CartItemsListState();
}

class _CartItemsListState extends State<CartItemsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return getIt<CartCubit>().cartItemModels.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.addProduct,
                      width: 100,
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: getIt<CartCubit>().cartItemModels.length,
                itemBuilder: (context, index) {
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
                      getIt<CartCubit>().removeItem(index);
                    },
                    child: CartItem(
                        cartItemModel:
                            getIt<CartCubit>().cartItemModels[index]),
                  );
                },
              );
      },
    );
  }
}
