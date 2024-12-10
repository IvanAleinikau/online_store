import 'package:injectable/injectable.dart';
import 'package:online_shop/domain/entity/products/products_entity.dart';
import 'package:online_shop/domain/repository/cart_repository.dart';
import 'package:online_shop/domain/use_cases/nothing.dart';
import 'package:online_shop/domain/use_cases/use_case.dart';

/// Use case for get cart products
@Injectable()
class GetCartProductsUseCase extends UseCase<List<ProductsEntity>, Nothing> {
  /// Default constructor
  GetCartProductsUseCase(this._cartRepository);

  final CartRepository _cartRepository;

  @override
  Future<List<ProductsEntity>> call(Nothing value) async {
    final result = await _cartRepository.getCartProducts();
    return result.map(ProductsEntity.fromModel).toList();
  }
}
