import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_shop/data/models/products/product_model.dart';

part 'get_products_response_model.freezed.dart';

part 'get_products_response_model.g.dart';

/// Response model when we try to get a list of products
@freezed
class GetProductsResponseModel with _$GetProductsResponseModel {
  /// Response model constructor
  const factory GetProductsResponseModel({
    @JsonKey(name: 'products') required List<ProductModel>? products,
    @JsonKey(name: 'total') required int? total,
    @JsonKey(name: 'skip') required int? skip,
    @JsonKey(name: 'limit') required int? limit,
  }) = _GetProductsResponseModel;

  /// From json method
  factory GetProductsResponseModel.fromJson(Map<String, dynamic> json) => _$GetProductsResponseModelFromJson(json);
}
