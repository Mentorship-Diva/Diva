import 'package:mentorship/features/home/data/models/product_response_model.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class CategorySelected extends HomeState {
  final int index;
  CategorySelected(this.index);
}

final class HomeProdcutsSuccess extends HomeState {
  final List<Product> products;
  final String? selectedCategory;
  HomeProdcutsSuccess(this.products, this.selectedCategory);
}

final class HomeProdcutsLoading extends HomeState {}

final class HomeProdcutsError extends HomeState {
  final String message;
  HomeProdcutsError(this.message);
}

final class HomeCategoriesSuccess extends HomeState {
  final List<String> categories;
  HomeCategoriesSuccess(this.categories);
}

final class HomeCategoriesLoading extends HomeState {}

final class HomeCategoriesError extends HomeState {
  final String message;
  HomeCategoriesError(this.message);
}
