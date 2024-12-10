import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/utilities/bloc/bloc_factory.dart';
import 'package:online_shop/domain/entity/products/products_entity.dart';
import 'package:online_shop/presentation/components/app_counter_widget.dart';
import 'package:online_shop/presentation/components/buttons/app_button.dart';
import 'package:online_shop/presentation/screens/products/bloc/products_bloc.dart';
import 'package:online_shop/presentation/utils/extension/num_extension.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';
import 'package:online_shop/presentation/utils/theme/app_styles.dart';
import 'package:provider/provider.dart';

/// Product screen
@RoutePage()
class ProductScreen extends StatelessWidget {
  /// Default constructor
  const ProductScreen({
    super.key,
    required this.entity,
  });

  /// Entity id
  final ProductsEntity entity;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        const event = ProductsEvent.fetch();
        return context.read<BlocFactory>().create<ProductsBloc>()..add(event);
      },
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          final bloc = context.read<ProductsBloc>();

          final product =
              state.mapOrNull(success: (state) => state.products.firstWhere((e) => e.id == entity.id)) ?? entity;

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: product.images.first,
                  ),
                  24.height,
                  Text(
                    product.title,
                    maxLines: 2,
                    style: AppStyles.regularBigStyle(),
                  ),
                  12.height,
                  Text(
                    product.description,
                    style: AppStyles.regularNormalStyle(),
                  ),
                  12.height,
                  Text(
                    '${product.price}\$',
                    style: AppStyles.regularSmallStyle(color: Palette.grey700),
                  ),
                  12.height,
                  if (product.count != 0)
                    AppCounterWidget(
                      value: product.count,
                      onCountChanged: (int value) => bloc.add(
                        ProductsEvent.changeProductCount(
                          entityId: product.id,
                          value: value,
                        ),
                      ),
                    )
                  else
                    AppButton.filled(
                      text: 'Add to Card',
                      width: double.maxFinite,
                      onTap: () => bloc.add(ProductsEvent.addToCart(entity: product)),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
