import 'package:dio/dio.dart';
import 'package:mentorship/core/networking/api_constants.dart';
import 'package:mentorship/features/home/data/apis/home_api_constants.dart';
import 'package:mentorship/features/home/data/models/product_details_model.dart';
import 'package:mentorship/features/home/data/models/product_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;
  @GET(HomeApiConstants.productsEP)
  Future<List<Product>> getProducts();
  @GET(HomeApiConstants.categoriesEP)
  Future<List<String>> getCategories();
  @GET(HomeApiConstants.categoryProductsEP)
  Future<List<Product>> getCategoryProducts(
      @Path("categoryName") String categoryName);
  @GET(HomeApiConstants.productDetailsEP)
  Future<ProductDetailsModel> getProductDetails(@Path("id") String id);
}
