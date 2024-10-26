import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/features/home/data/models/product_response_model.dart';
import 'package:mentorship/features/home/data/repo/home_repo.dart';
import 'package:mentorship/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<Product> allProducts = []; // Store all products here
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeInitial());

  //* Select category index
  void selectCategory(int index) {
    emit(CategorySelected(index));
  }

  //* Load categories and emit states
  Future<void> loadCategories() async {
    if (isClosed) return;
    emit(HomeCategoriesLoading());

    try {
      final response = await _homeRepo.getCategories();
      response.when(
        success: (categoriesResponse) {
          emit(HomeCategoriesSuccess(categoriesResponse));
        },
        failure: (message) {
          emit(HomeCategoriesError(message));
        },
      );
    } catch (e) {
      emit(HomeCategoriesError("Failed to load categories: ${e.toString()}"));
    }
  }

  //* Load products and store them in `allProducts`
  Future<void> loadProducts() async {
    if (isClosed) return;
    emit(HomeState.productsLoading());

    try {
      final response = await _homeRepo.getProducts();
      response.when(
        success: (productsResponse) {
          if (!isClosed) {
            allProducts = productsResponse; // Store all products directly
            emit(HomeState.productsSuccess(productsResponse, null));
          }
        },
        failure: (message) {
          if (!isClosed) {
            emit(HomeState.productsError(message));
          }
        },
      );
    } catch (e) {
      emit(HomeState.productsError("Failed to load products: ${e.toString()}"));
    }
  }

  //* Search products based on the query
  void searchProducts(String query) {
    if (query.trim().isEmpty) {
      emit(HomeState.productsSuccess(
          allProducts, null)); // Show all products if query is empty
      return;
    }

    final filteredProducts = allProducts
        .where((product) =>
            product.title.toLowerCase().contains(query.trim().toLowerCase()) ??
            false)
        .toList();

    log('Filtered Products: $filteredProducts');
    log('All Products: $allProducts');

    if (filteredProducts.isNotEmpty) {
      emit(HomeState.productsSuccess(filteredProducts, null));
    } else {
      emit(HomeState.productsError("No products found for '$query'."));
    }
  }

  //* Load products for a specific category
  Future<void> loadCategoryProducts(String categoryName) async {
    if (isClosed) return;
    emit(HomeState.productsLoading());

    try {
      final response = await _homeRepo.getCategoryProducts(categoryName);
      response.when(
        success: (productsResponse) {
          emit(HomeState.productsSuccess(productsResponse, categoryName));
        },
        failure: (message) {
          emit(HomeState.productsError(message));
        },
      );
    } catch (e) {
      emit(HomeState.productsError("Failed to load products: ${e.toString()}"));
    }
  }

  //* Load product details
  Future<void> loadProductDetails(String productId) async {
    emit(HomeState.productsLoading());

    try {
      final response = await _homeRepo.getProductDetails(productId);
      response.when(
        success: (productDetailsResponse) {
          emit(HomeState.productDetailsSuccess(productDetailsResponse));
        },
        failure: (message) {
          emit(HomeState.productDetailsError(message));
        },
      );
    } catch (e) {
      emit(HomeState.productDetailsError(
          "Failed to load product details: ${e.toString()}"));
    }
  }

  //* Load random products
  Future<void> loadRandomProducts(int limitNumber) async {
    emit(HomeState.randomProductsLoading());

    try {
      final response = await _homeRepo.getRandomProducts(limitNumber);
      response.when(
        success: (products) {
          emit(HomeState.randomProductsSuccess(products));
        },
        failure: (message) {
          emit(HomeState.randomProductsError(message));
        },
      );
    } catch (e) {
      emit(HomeState.randomProductsError(
          "Failed to load random items: ${e.toString()}"));
    }
  }

  //* Navigate to product details with the selected productId
  void navigateToProductDetails(int productId) {
    emit(HomeState.navigateToProductDetails(productId));
  }
}
