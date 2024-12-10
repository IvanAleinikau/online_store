import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:online_shop/domain/entity/products/products_entity.dart';
import 'package:online_shop/domain/use_cases/cart/get_cart_products_use_case.dart';
import 'package:online_shop/domain/use_cases/cart/update_cart_products_use_case.dart';
import 'package:online_shop/domain/use_cases/nothing.dart';

part 'cart_bloc.freezed.dart';

part 'cart_event.dart';

part 'cart_state.dart';

/// Data BLoC
@Injectable()
class CartBloc extends Bloc<CartEvent, CartState> {
  /// Default constructor.
  CartBloc(
    this._getCartProductsUseCase,
    this._updateCartProductsUseCase,
  ) : super(const CartState.loading()) {
    on<_CartFetchEvent>(_handleFetchEvent);
    on<_CartChangeProductCountEvent>(_handleChangeProductCountEvent);
  }

  final GetCartProductsUseCase _getCartProductsUseCase;
  final UpdateCartProductsUseCase _updateCartProductsUseCase;

  Future<void> _handleFetchEvent(
    _CartFetchEvent event,
    Emitter<CartState> emit,
  ) async {
    final products = await _getCartProductsUseCase.call(Nothing());

    emit(CartState.success(products: products));
  }

  Future<void> _handleChangeProductCountEvent(
    _CartChangeProductCountEvent event,
    Emitter<CartState> emit,
  ) async {
    await state.mapOrNull(
      success: (state) async {
        var cartProduct = [...state.products];

        if (event.value == 0) {
          cartProduct = cartProduct..removeWhere((e) => e.id == event.entityId);
        } else {
          for (var i = 0; i < cartProduct.length; i++) {
            if (event.entityId == cartProduct[i].id) {
              cartProduct[i] = cartProduct[i].copyWith(count: event.value);
            }
          }
        }
        await _updateCartProductsUseCase.call(cartProduct);

        final cartProducts = await _getCartProductsUseCase.call(Nothing());

        emit(state.copyWith(products: cartProducts));
      },
    );
  }
}
