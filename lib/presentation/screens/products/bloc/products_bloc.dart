import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:online_shop/domain/entity/products/products_entity.dart';
import 'package:online_shop/domain/entity/products/request_entity.dart';
import 'package:online_shop/domain/use_cases/cart/get_cart_products_use_case.dart';
import 'package:online_shop/domain/use_cases/cart/update_cart_products_use_case.dart';
import 'package:online_shop/domain/use_cases/nothing.dart';
import 'package:online_shop/domain/use_cases/products/get_products_use_case.dart';

part 'products_bloc.freezed.dart';

part 'products_event.dart';

part 'products_state.dart';

/// Data BLoC
@Injectable()
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  /// Default constructor.
  ProductsBloc(
    this._getProductsUseCase,
    this._updateCartProductsUseCase,
    this._getCartProductsUseCase,
  ) : super(const ProductsState.loading()) {
    on<_ProductsFetchEvent>(_handleFetchEvent);
    on<_ProductsFetchNextPageEvent>(_handleFetchNextPageEvent);
    on<_ProductsAddToCarPageEvent>(_handleAddToCarPageEvent);
    on<_ProductsChangeProductCountEvent>(_handleChangeProductCountEvent);
  }

  final GetProductsUseCase _getProductsUseCase;
  final GetCartProductsUseCase _getCartProductsUseCase;
  final UpdateCartProductsUseCase _updateCartProductsUseCase;

  static const _defaultLimit = 30;

  Future<void> _handleFetchEvent(
    _ProductsFetchEvent event,
    Emitter<ProductsState> emit,
  ) async {
    final data = await _getProductsUseCase.call(RequestEntity(limit: _defaultLimit, skip: 0));
    final cartProducts = await _getCartProductsUseCase.call(Nothing());

    final products = _sortProducts(cartProducts, data.products);

    final totalPages = data.total / _defaultLimit;

    emit(
      ProductsState.success(
        products: products,
        currentPage: 0,
        totalPages: totalPages.ceil(),
        cartProducts: cartProducts,
      ),
    );
  }

  Future<void> _handleFetchNextPageEvent(
    _ProductsFetchNextPageEvent event,
    Emitter<ProductsState> emit,
  ) async {
    await state.mapOrNull(
      success: (state) async {
        final nextPage = state.currentPage + 1;

        final data = await _getProductsUseCase.call(
          RequestEntity(
            limit: _defaultLimit,
            skip: _defaultLimit * nextPage,
          ),
        );

        final products = _sortProducts(state.cartProducts, [...state.products, ...data.products]);

        emit(state.copyWith(products: products, currentPage: nextPage));
      },
    );
  }

  Future<void> _handleAddToCarPageEvent(
    _ProductsAddToCarPageEvent event,
    Emitter<ProductsState> emit,
  ) async {
    await state.mapOrNull(
      success: (state) async {
        final entity = event.entity.copyWith(count: 1);
        await _updateCartProductsUseCase.call([...state.cartProducts, entity]);

        final cartProducts = await _getCartProductsUseCase.call(Nothing());

        final products = _sortProducts(cartProducts, state.products);

        emit(state.copyWith(cartProducts: cartProducts, products: products));
      },
    );
  }

  Future<void> _handleChangeProductCountEvent(
    _ProductsChangeProductCountEvent event,
    Emitter<ProductsState> emit,
  ) async {
    await state.mapOrNull(
      success: (state) async {
        var cartProduct = [...state.cartProducts];
        final tempProducts = [...state.products];

        if (event.value == 0) {
          cartProduct = cartProduct..removeWhere((e) => e.id == event.entityId);
        } else {
          for (var i = 0; i < cartProduct.length; i++) {
            if (event.entityId == cartProduct[i].id) {
              cartProduct[i] = cartProduct[i].copyWith(count: event.value);
            }
          }
        }

        for (var i = 0; i < tempProducts.length; i++) {
          if (event.entityId == tempProducts[i].id) {
            tempProducts[i] = tempProducts[i].copyWith(count: event.value);
          }
        }
        await _updateCartProductsUseCase.call(cartProduct);

        final cartProducts = await _getCartProductsUseCase.call(Nothing());

        final products = _sortProducts(cartProducts, tempProducts);
        emit(state.copyWith(products: products, cartProducts: cartProducts));
      },
    );
  }

  List<ProductsEntity> _sortProducts(List<ProductsEntity> cartProducts, List<ProductsEntity> products) {
    final tempProducts = [...products];
    for (final cartProduct in cartProducts) {
      for (var i = 0; i < tempProducts.length; i++) {
        if (cartProduct.id == tempProducts[i].id) {
          tempProducts[i] = cartProduct;
        }
      }
    }
    return tempProducts;
  }
}
