import 'package:online_shop/data/models/products/product_model.dart';

/// Products Entity class
class ProductsEntity {
  /// Default constructor
  ProductsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.thumbnail,
    required this.count,
  });

  /// Constructor for translate model into entity
  factory ProductsEntity.fromModel(ProductModel model) => ProductsEntity(
        id: model.id ?? 0,
        title: model.title ?? '',
        description: model.description ?? '',
        price: model.price ?? 0,
        images: model.images ?? [],
        thumbnail: model.thumbnail ?? '',
        count: model.count ?? 0,
      );

  /// Copy with method
  ProductsEntity copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    List<String>? images,
    String? thumbnail,
    int? count,
  }) {
    return ProductsEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
      count: count ?? this.count,
    );
  }

  /// Product id
  final int id;

  /// Product title
  final String title;

  /// Product description
  final String description;

  /// Product price
  final double price;

  /// Product list of images
  final List<String> images;

  /// Product thumbnail
  final String thumbnail;

  /// Count this product in cart
  final int count;
}
