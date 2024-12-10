import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/utilities/bloc/bloc_factory.dart';
import 'package:online_shop/presentation/components/app_loading_widget.dart';
import 'package:online_shop/presentation/components/product_item.dart';
import 'package:online_shop/presentation/screens/shopping_cart/bloc/cart_bloc.dart';
import 'package:online_shop/presentation/utils/extension/num_extension.dart';
import 'package:online_shop/presentation/utils/navigation/app_router.gr.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';

/// Products Screen
/// This screen displays all selected products available for purchase.
class ShoppingCartScreen extends StatefulWidget {
  /// Default
  const ShoppingCartScreen({
    super.key,
    required this.onCartAmountChanged,
  });

  /// Callback for update cart badge
  final ValueChanged<int> onCartAmountChanged;

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        surfaceTintColor: Palette.transparent,
        backgroundColor: Palette.white,
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) {
          const event = CartEvent.fetch();
          return context.read<BlocFactory>().create<CartBloc>()..add(event);
        },
        child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            state.mapOrNull(success: (state) => widget.onCartAmountChanged(state.products.length));
          },
          builder: (context, state) {
            final bloc = context.read<CartBloc>();

            return state.map(
              loading: (_) => const AppLoadingWidget(),
              success: (state) => ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products.elementAt(index);
                  return ProductItem.cart(
                    entity: product,
                    onTap: () async {
                      await context.router.push(ProductRoute(entity: product));
                      bloc.add(const CartEvent.fetch());
                    },
                    onCountChanged: (int value) => bloc.add(
                      CartEvent.changeProductCount(
                        entityId: product.id,
                        value: value,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => 12.height,
              ),
            );
          },
        ),
      ),
    );
  }
}
