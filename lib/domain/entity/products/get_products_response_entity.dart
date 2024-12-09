import 'package:online_shop/data/models/products/get_products_response_model.dart';
import 'package:online_shop/domain/entity/products/products_entity.dart';

/// Response entity when we get list of products
class GetProductsResponseEntity {
  /// Default constructor
  GetProductsResponseEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  /// Constructor for translate model into entity
  factory GetProductsResponseEntity.fromModel(GetProductsResponseModel model) => GetProductsResponseEntity(
        products: model.products?.map(ProductsEntity.fromModel).toList() ?? [],
        total: model.total ?? 0,
        skip: model.skip ?? 0,
        limit: model.limit ?? 0,
      );

  /// List of products
  final List<ProductsEntity> products;

  /// Total number of products
  final int total;

  /// Number of skipped products
  final int skip;

  /// Number of products on one page
  final int limit;
}
