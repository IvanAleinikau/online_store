import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/domain/entity/products/products_entity.dart';
import 'package:online_shop/presentation/components/app_counter_widget.dart';
import 'package:online_shop/presentation/components/buttons/app_button.dart';
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
    this.onAddToCart,
    required this.onCountChanged,
  }) : isCart = false;

  /// Constructor for cart screen
  const ProductItem.cart({
    super.key,
    required this.entity,
    required this.onTap,
    this.onAddToCart,
    required this.onCountChanged,
  }) : isCart = true;

  /// Product entity
  final ProductsEntity entity;

  /// On Tap callback
  final VoidCallback onTap;

  /// On Add to cart callback
  final ValueSetter<ProductsEntity>? onAddToCart;

  /// Callback when count changed
  final ValueChanged<int> onCountChanged;

  /// Is cart marker
  final bool isCart;

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
        child: isCart
            ? Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: entity.images.first,
                    height: 80,
                    width: 80,
                  ),
                  4.width,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entity.title,
                          maxLines: 3,
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
                  4.width,
                  Expanded(
                    child: AppCounterWidget(
                      value: entity.count,
                      onCountChanged: onCountChanged,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: entity.images.first,
                    height: 100,
                    width: 100,
                  ),
                  24.height,
                  Expanded(
                    child: Text(
                      entity.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: AppStyles.regularBigStyle(),
                    ),
                  ),
                  12.height,
                  Text(
                    '${entity.price}\$',
                    style: AppStyles.regularSmallStyle(color: Palette.grey700),
                  ),
                  24.height,
                  if (entity.count != 0)
                    AppCounterWidget(
                      value: entity.count,
                      onCountChanged: onCountChanged,
                    )
                  else
                    AppButton.filled(
                      text: 'Add to Card',
                      width: double.maxFinite,
                      onTap: () => onAddToCart?.call(entity),
                    ),
                ],
              ),
      ),
    );
  }
}
