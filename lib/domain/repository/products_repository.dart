import 'package:either_dart/either.dart';
import 'package:online_shop/data/error/app_error_model.dart';
import 'package:online_shop/data/models/products/get_products_response_model.dart';

/// Abstract products repository
abstract class ProductsRepository {
  /// Get products method with params
  Future<Either<AppErrorModel, GetProductsResponseModel>> getProducts({
    required int limit,
    required int skip,
  });
}
