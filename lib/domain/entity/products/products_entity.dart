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
  });

  /// Constructor for translate model into entity
  factory ProductsEntity.fromModel(ProductModel model) => ProductsEntity(
        id: model.id ?? 0,
        title: model.title ?? '',
        description: model.description ?? '',
        price: model.price ?? 0,
        images: model.images ?? [],
        thumbnail: model.thumbnail ?? '',
      );

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
}
