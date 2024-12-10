import 'package:online_shop/data/models/products/product_model.dart';

/// Abstract products repository
abstract class CartRepository {
  /// Get products method with params
  Future<List<ProductModel>> getCartProducts();

  /// Update products
  Future<void> updateCart(List<ProductModel> products);
}
