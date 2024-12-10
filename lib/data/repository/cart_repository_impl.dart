import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:online_shop/data/models/products/product_model.dart';
import 'package:online_shop/domain/repository/cart_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Cart repository impl
@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  /// Default constructor
  CartRepositoryImpl(this._apiClient);

  final SharedPreferencesAsync _apiClient;

  static const _cart = 'cart';

  @override
  Future<List<ProductModel>> getCartProducts() async {
    final value = await _apiClient.getString(_cart) ?? '[]';
    final list = jsonDecode(value) as List<dynamic>;
    return list.map((dynamic i) => ProductModel.fromJson(i as Map<String, dynamic>)).toList();
  }

  @override
  Future<void> updateCart(List<ProductModel> products) {
    final value = jsonEncode(products);
    return _apiClient.setString(_cart, value);
  }
}
