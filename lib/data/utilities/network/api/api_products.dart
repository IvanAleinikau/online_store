import 'package:dio/dio.dart';
import 'package:online_shop/data/models/products/get_products_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_products.g.dart';

/// App api products
@RestApi()
abstract class ApiProducts {
  /// Default constructor
  factory ApiProducts(
    Dio dio, {
    String baseUrl,
  }) = _ApiProducts;

  /// Request to get a list of products with pagination option
  @GET('/products')
  Future<HttpResponse<GetProductsResponseModel>> getProducts({
    @Query('limit') required int limit,
    @Query('skip') required int skip,
  });
}
