import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_shop/data/error/app_error_model.dart';
import 'package:online_shop/data/models/products/get_products_response_model.dart';
import 'package:online_shop/data/utilities/network/api_client.dart';
import 'package:online_shop/domain/repository/products_repository.dart';

/// Products repository impl
@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  /// Default constructor
  ProductsRepositoryImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<Either<AppErrorModel, GetProductsResponseModel>> getProducts({required int limit, required int skip}) async {
    try {
      final result = await _apiClient.apiProducts.getProducts(limit: limit, skip: skip);

      return switch (result.response.statusCode ?? 0) {
        200 => Right(result.data),
        404 => const Left(AppErrorModel.notFound()),
        _ => const Left(AppErrorModel.notAvailable()),
      };
    } catch (_) {
      return const Left(AppErrorModel.notAvailable());
    }
  }
}
