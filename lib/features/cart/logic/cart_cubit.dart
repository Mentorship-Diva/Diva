import 'package:bloc/bloc.dart';
import 'package:mentorship/features/cart/data/cart_item_model.dart';
import 'package:meta/meta.dart';
import '../../../core/theming/assets.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    cartItemModels = List.generate(
      8,
      (index) => CartItemModel(AppAssets.cartGirl, '${(index + 1) * 200}'),
    );
  }

  late List<CartItemModel> cartItemModels;

  int discount = 100;
  int deliveryFee = 40;

  void removeItem(int index) {
    cartItemModels.removeAt(index);
    emit(RemoveItem());
  }

  double getTotalPrice() {
    return cartItemModels.fold(0.0, (sum, item) {
      final price = double.tryParse(item.price ?? '0') ?? 0;
      return sum + price;
    });
  }
}
