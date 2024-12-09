import 'package:flutter/material.dart';
import 'package:online_shop/domain/entity/products/products_entity.dart';
import 'package:online_shop/presentation/utils/extension/num_extension.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';
import 'package:online_shop/presentation/utils/theme/app_styles.dart';

/// Product Item
class ProductItem extends StatelessWidget {
  /// Default constructor
  const ProductItem({
    super.key,
    required this.entity,
    required this.onTap,
  });

  /// Product entity
  final ProductsEntity entity;

  /// On Tap callback
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12);
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: borderRadius,
        ),
        child: Column(
          children: [
            Image.network(
              entity.images.first,
              height: 100,
              width: 100,
            ),
            24.height,
            Text(
              entity.title,
              textAlign: TextAlign.center,
              style: AppStyles.regularBigStyle(),
            ),
            12.height,
            Text(
              '${entity.price}\$',
              style: AppStyles.regularSmallStyle(color: Palette.grey700),
            ),
          ],
        ),
      ),
    );
  }
}
