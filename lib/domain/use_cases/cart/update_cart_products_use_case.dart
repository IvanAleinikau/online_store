import 'package:injectable/injectable.dart';
import 'package:online_shop/data/models/products/product_model.dart';
import 'package:online_shop/domain/entity/products/products_entity.dart';
import 'package:online_shop/domain/repository/cart_repository.dart';
import 'package:online_shop/domain/use_cases/use_case.dart';

/// Use case for update cart products
@Injectable()
class UpdateCartProductsUseCase extends UseCase<void, List<ProductsEntity>> {
  /// Default constructor
  UpdateCartProductsUseCase(this._cartRepository);

  final CartRepository _cartRepository;

  @override
  Future<void> call(List<ProductsEntity> value) {
    final models = value
        .map(
          (e) => ProductModel(
            id: e.id,
            title: e.title,
            description: e.description,
            price: e.price,
            images: e.images,
            thumbnail: e.thumbnail,
            count: e.count,
          ),
        )
        .toList();
    return _cartRepository.updateCart(models);
  }
}
