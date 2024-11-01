import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentorship/features/wishlist/data/models/product_model.dart';
part 'wishlist_state.freezed.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.loading() = WishlistLoading;
  const factory WishlistState.loaded(List<ProductModel> wishlist) =
      WishlistLoaded;
  const factory WishlistState.error(String message) = WishlistError;
}
