import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:online_shop/domain/entity/products/products_entity.dart';
import 'package:online_shop/domain/entity/products/request_entity.dart';
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
  ) : super(const ProductsState.loading()) {
    on<_ProductsFetchEvent>(_handleFetchEvent);
  }

  final GetProductsUseCase _getProductsUseCase;

  static const _defaultLimit = 30;
  var _currentPage = 0;

  Future<void> _handleFetchEvent(
    _ProductsFetchEvent event,
    Emitter<ProductsState> emit,
  ) async {
    final data = await _getProductsUseCase.call(
      RequestEntity(
        limit: _defaultLimit,
        skip: _currentPage * _defaultLimit,
      ),
    );

    emit(
      ProductsState.success(products: data.products),
    );
  }
}
