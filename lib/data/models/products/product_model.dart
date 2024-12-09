import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

/// Product model from api
@freezed
class ProductModel with _$ProductModel {
  /// Product model constructor
  const factory ProductModel({
    @JsonKey(name: 'id') required int? id,
    @JsonKey(name: 'title') required String? title,
    @JsonKey(name: 'description') required String? description,
    @JsonKey(name: 'price') required double? price,
    @JsonKey(name: 'images') required List<String>? images,
    @JsonKey(name: 'thumbnail') required String? thumbnail,
  }) = _ProductModel;

  /// From json method
  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
