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
    on<_ProductsFetchNextPageEvent>(_handleFetchNextPageEvent);
  }

  final GetProductsUseCase _getProductsUseCase;

  static const _defaultLimit = 30;

  Future<void> _handleFetchEvent(
    _ProductsFetchEvent event,
    Emitter<ProductsState> emit,
  ) async {
    final data = await _getProductsUseCase.call(RequestEntity(limit: _defaultLimit, skip: 0));

    final totalPages = data.total / _defaultLimit;

    emit(
      ProductsState.success(
        products: data.products,
        currentPage: 0,
        totalPages: totalPages.ceil(),
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

        emit(
          state.copyWith(
            products: [...state.products, ...data.products],
            currentPage: nextPage,
          ),
        );
      },
    );
  }
}
