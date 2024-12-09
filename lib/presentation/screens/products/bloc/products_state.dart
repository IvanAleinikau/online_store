part of 'products_bloc.dart';

/// Products State
@freezed
class ProductsState with _$ProductsState {
  /// State when loading occurs
  const factory ProductsState.loading() = _$ProductsLoadingState;

  /// State when success occurs
  const factory ProductsState.success({
    required List<ProductsEntity> products,
  }) = _$ProductsSuccessState;
}
