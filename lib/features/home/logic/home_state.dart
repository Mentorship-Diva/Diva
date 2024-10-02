import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentorship/features/home/data/models/product_details_model.dart';
import 'package:mentorship/features/home/data/models/product_response_model.dart';
part 'home_state.freezed.dart';

@Freezed()
class HomeState with _$HomeState {
  // Initial state
  const factory HomeState.initial() = HomeInitial;

  // Category selected state
  const factory HomeState.categorySelected(int index) = CategorySelected;

  // Products loading state
  const factory HomeState.productsLoading() = HomeProductsLoading;

  // Products success state
  const factory HomeState.productsSuccess(
      List<Product> products, String? selectedCategory) = HomeProductsSuccess;

  // Products error state
  const factory HomeState.productsError(String message) = HomeProductsError;

  // Categories loading state
  const factory HomeState.categoriesLoading() = HomeCategoriesLoading;

  // Categories success state
  const factory HomeState.categoriesSuccess(List<String> categories) =
      HomeCategoriesSuccess;

  // Categories error state
  const factory HomeState.categoriesError(String message) = HomeCategoriesError;
  // Product Details loading state
  const factory HomeState.productDetailsLoading() = HomeProductDetailsLoading;

  // Product Details success state
  const factory HomeState.productDetailsSuccess(ProductDetailsModel product) =
      HomeProductDetailsSuccess;

  // Product Details error state
  const factory HomeState.productDetailsError(String message) =
      HomeProductDetailsError;
}
