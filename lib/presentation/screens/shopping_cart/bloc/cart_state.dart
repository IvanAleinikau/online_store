part of 'cart_bloc.dart';

/// Cart State
@freezed
class CartState with _$CartState {
  /// State when loading occurs
  const factory CartState.loading() = _$CartLoadingState;

  /// State when success occurs
  const factory CartState.success({
    required List<ProductsEntity> products,
  }) = _$CartSuccessState;
}
