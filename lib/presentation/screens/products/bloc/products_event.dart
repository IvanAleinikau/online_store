part of 'products_bloc.dart';

/// Event for Products Bloc Screen
@freezed
class ProductsEvent with _$ProductsEvent {
  /// Event to fetch products
  const factory ProductsEvent.fetch() = _ProductsFetchEvent;
}
