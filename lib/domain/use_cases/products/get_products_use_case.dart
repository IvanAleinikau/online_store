import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:online_shop/data/error/app_error_model.dart';
import 'package:online_shop/domain/entity/products/get_products_response_entity.dart';
import 'package:online_shop/domain/entity/products/request_entity.dart';
import 'package:online_shop/domain/repository/products_repository.dart';
import 'package:online_shop/domain/use_cases/use_case.dart';

/// Use case for get some products
@Injectable()
class GetProductsUseCase implements UseCase<Either<AppErrorModel, GetProductsResponseEntity>, RequestEntity> {
  /// Default constructor
  GetProductsUseCase(this._productsRepository);

  final ProductsRepository _productsRepository;

  @override
  Future<Either<AppErrorModel, GetProductsResponseEntity>> call(RequestEntity request) async {
    final response = await _productsRepository.getProducts(limit: request.limit, skip: request.skip);

    return response.fold(
      Left.new,
      (data) => Right(GetProductsResponseEntity.fromModel(data)),
    );
  }
}
