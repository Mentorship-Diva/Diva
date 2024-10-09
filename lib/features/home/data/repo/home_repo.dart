import 'package:mentorship/core/networking/api_result.dart';
import 'package:mentorship/features/home/data/apis/home_api_service.dart';
import 'package:mentorship/features/home/data/models/product_details_model.dart';
import 'package:mentorship/features/home/data/models/product_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;
  HomeRepo(this._homeApiService);
  Future<ApiResult<List<Product>>> getProducts() async {
    try {
      final response = await _homeApiService.getProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<List<Product>>> getCategoryProducts(
      String categoryName) async {
    try {
      final response = await _homeApiService.getCategoryProducts(categoryName);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<List<String>>> getCategories() async {
    try {
      final response = await _homeApiService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<ProductDetailsModel>> getProductDetails(String id) async {
    try {
      final response = await _homeApiService.getProductDetails(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<List<Product>>> getRandomProducts(int limitNumber) async {
    try {
      final response = await _homeApiService.getRandomProducts(limitNumber);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
