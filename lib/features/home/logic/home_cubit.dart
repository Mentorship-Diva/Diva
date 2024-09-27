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
    emit(HomeProdcutsLoading());
    try {
      final response = await _homeRepo.getProducts();

      response.when(
        success: (productsResponse) {
          emit(HomeProdcutsSuccess(productsResponse));
        },
        failure: (message) {
          emit(HomeProdcutsError(message));
        },
      );
    } catch (e) {
      emit(HomeProdcutsError("Failed to load products: ${e.toString()}"));
    }
  }
}
