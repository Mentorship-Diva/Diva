import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:mentorship/features/wishlist/data/models/product_model.dart';
import 'package:mentorship/features/wishlist/logic/cubit/wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(const WishlistState.loading()) {
    _loadWishlist();
  }

  Future<void> _loadWishlist() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? wishlistJson = prefs.getString('wishlist');

      if (wishlistJson != null) {
        final List<dynamic> decoded = json.decode(wishlistJson);
        final List<ProductModel> wishlist = decoded
            .map((item) => ProductModel.fromMap(item as Map<String, dynamic>))
            .toList();
        emit(WishlistState.loaded(wishlist));
      } else {
        emit(const WishlistState.loaded([]));
      }
    } catch (e) {
      emit(WishlistState.error('Failed to load wishlist.'));
    }
  }

  Future<void> addToWishlist(ProductModel product) async {
    final currentState = state;
    if (currentState is WishlistLoaded) {
      final List<ProductModel> updatedWishlist =
          List.from(currentState.wishlist)..add(product);
      emit(WishlistState.loaded(updatedWishlist));
      await _saveWishlist(updatedWishlist);
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    final currentState = state;
    if (currentState is WishlistLoaded) {
      final List<ProductModel> updatedWishlist =
          currentState.wishlist.where((item) => item.id != productId).toList();
      emit(WishlistState.loaded(updatedWishlist));
      await _saveWishlist(updatedWishlist);
    }
  }

  bool isInWishlist(String productId) {
    final currentState = state;
    if (currentState is WishlistLoaded) {
      return currentState.wishlist.any((item) => item.id == productId);
    }
    return false;
  }

  Future<void> _saveWishlist(List<ProductModel> wishlist) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedWishlist = json.encode(
      wishlist.map((e) => e.toMap()).toList(),
    );
    await prefs.setString('wishlist', encodedWishlist);
  }
}
