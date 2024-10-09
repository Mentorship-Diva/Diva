import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/features/home/data/repo/home_repo.dart';
import 'package:mentorship/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeInitial());
  //* Update the selected category index
  void selectCategory(int index) {
    emit(CategorySelected(index));
  }

  //* Fetch categories and emit states
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

  //* Fetch products and emit states
  Future<void> loadProducts() async {
    if (isClosed) return;
    emit(HomeState.productsLoading());
    try {
      final response = await _homeRepo.getProducts();

      response.when(
        success: (productsResponse) {
          if (!isClosed) {
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

  //* Fetch products of a specific  category and emit states
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

  //* Fetch products of a specific  category and emit states
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

  //* Fetch products of a specific  category and emit states
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

  void navigateToProductDetails(int productId) {
    emit(HomeState.navigateToProductDetails(productId));
    loadProducts();
    loadCategories();
  }
}
