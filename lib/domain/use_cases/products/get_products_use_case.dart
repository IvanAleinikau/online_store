import 'package:injectable/injectable.dart';
import 'package:online_shop/domain/entity/products/get_products_response_entity.dart';
import 'package:online_shop/domain/entity/products/request_entity.dart';
import 'package:online_shop/domain/repository/products_repository.dart';
import 'package:online_shop/domain/use_cases/use_case.dart';

/// Use case for get some products
@Injectable()
class GetProductsUseCase implements UseCase<GetProductsResponseEntity, RequestEntity> {
  /// Default constructor
  GetProductsUseCase(this._productsRepository);

  final ProductsRepository _productsRepository;

  @override
  Future<GetProductsResponseEntity> call(RequestEntity request) async {
    final responseModel = await _productsRepository.getProducts(limit: request.limit, skip: request.skip);
    return GetProductsResponseEntity.fromModel(responseModel);
  }
}
