import 'package:online_shop/data/models/products/get_products_response_model.dart';

/// Abstract products repository
abstract class ProductsRepository {
  /// Get products method with params
  Future<GetProductsResponseModel> getProducts({
    required int limit,
    required int skip,
  });
}
