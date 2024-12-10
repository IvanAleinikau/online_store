import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/utilities/bloc/bloc_factory.dart';
import 'package:online_shop/presentation/components/app_loading_widget.dart';
import 'package:online_shop/presentation/components/product_item.dart';
import 'package:online_shop/presentation/screens/products/bloc/products_bloc.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';

/// Products Screen
/// This screen displays all products available for purchase.
class ProductsScreen extends StatefulWidget {
  /// Default constructor
  const ProductsScreen({
    super.key,
    required this.onCartAmountChanged,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();

  /// Callback for update cart badge
  final ValueChanged<int> onCartAmountChanged;
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        surfaceTintColor: Palette.transparent,
        backgroundColor: Palette.white,
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) {
          const event = ProductsEvent.fetch();
          return context.read<BlocFactory>().create<ProductsBloc>()..add(event);
        },
        child: BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {
            state.mapOrNull(success: (state) => widget.onCartAmountChanged(state.cartProducts.length));
          },
          builder: (context, state) {
            final bloc = context.read<ProductsBloc>();

            return state.map(
              loading: (_) => const AppLoadingWidget(),
              success: (state) => NotificationListener<ScrollEndNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                    bloc.add(const ProductsEvent.nextPage());
                  }
                  return false;
                },
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.64,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products.elementAt(index);
                    return ProductItem(
                      entity: product,
                      onTap: () {},
                      onAddToCart: (entity) => bloc.add(ProductsEvent.addToCart(entity: entity)),
                      onCountChanged: (int value) => bloc.add(
                        ProductsEvent.changeProductCount(
                          entityId: product.id,
                          value: value,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
