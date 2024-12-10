part of 'cart_bloc.dart';

/// Event for Cart Bloc Screen
@freezed
class CartEvent with _$CartEvent {
  /// Event to fetch products
  const factory CartEvent.fetch() = _CartFetchEvent;

  /// Event to add product to cart
  const factory CartEvent.changeProductCount({
    required int entityId,
    required int value,
  }) = _CartChangeProductCountEvent;
}
