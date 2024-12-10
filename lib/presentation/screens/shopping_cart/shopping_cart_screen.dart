import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/utilities/bloc/bloc_factory.dart';
import 'package:online_shop/presentation/components/app_loading_widget.dart';
import 'package:online_shop/presentation/components/product_item.dart';
import 'package:online_shop/presentation/screens/shopping_cart/bloc/cart_bloc.dart';
import 'package:online_shop/presentation/utils/extension/num_extension.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';

/// Products Screen
/// This screen displays all selected products available for purchase.
class ShoppingCartScreen extends StatefulWidget {
  /// Default
  const ShoppingCartScreen({super.key});

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
        child: BlocBuilder<CartBloc, CartState>(
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
                    onTap: () {},
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