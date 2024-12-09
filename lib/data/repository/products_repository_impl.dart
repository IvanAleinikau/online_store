import 'package:injectable/injectable.dart';
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
  Future<GetProductsResponseModel> getProducts({required int limit, required int skip}) async {
    final result = await _apiClient.apiProducts.getProducts(limit: limit, skip: skip);
    return result.data;
  }
}
