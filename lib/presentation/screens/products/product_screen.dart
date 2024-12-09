import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/utilities/bloc/bloc_factory.dart';
import 'package:online_shop/presentation/components/app_loading_widget.dart';
import 'package:online_shop/presentation/screens/products/bloc/products_bloc.dart';
import 'package:online_shop/presentation/screens/products/widgets/product_item.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';

/// Products Screen
/// This screen displays all products available for purchase.
class ProductsScreen extends StatefulWidget {
  /// Default constructor
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
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
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            final bloc = context.read<ProductsBloc>();

            return state.map(
              loading: (_) => const AppLoadingWidget(),
              success: (state) => NotificationListener<ScrollEndNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {}
                  return false;
                },
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.58,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products.elementAt(index);
                    return ProductItem(
                      entity: product,
                      onTap: () {},
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
