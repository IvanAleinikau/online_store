part of 'products_bloc.dart';

/// Event for Products Bloc Screen
@freezed
class ProductsEvent with _$ProductsEvent {
  /// Event to fetch products
  const factory ProductsEvent.fetch() = _ProductsFetchEvent;

  /// Event to fetch next page of products
  const factory ProductsEvent.nextPage() = _ProductsFetchNextPageEvent;

  /// Event to add product to cart
  const factory ProductsEvent.addToCart({
    required ProductsEntity entity,
  }) = _ProductsAddToCarPageEvent;

  /// Event to add product to cart
  const factory ProductsEvent.changeProductCount({
    required int entityId,
    required int value,
  }) = _ProductsChangeProductCountEvent;
}
