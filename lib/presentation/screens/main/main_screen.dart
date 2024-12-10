import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/presentation/screens/main/enum/navigation_bar_type_enum.dart';
import 'package:online_shop/presentation/screens/products/product_screen.dart';
import 'package:online_shop/presentation/screens/shopping_cart/shopping_cart_screen.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';

/// Main screen
@RoutePage()
class MainScreen extends StatefulWidget {
  /// Default constructor
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _bottomTabs = [
    NavigationBarTypeEnum.products,
    NavigationBarTypeEnum.shoppingCart,
  ];

  final _activeTabNotifier = ValueNotifier(NavigationBarTypeEnum.products);

  void _onItemTapped(int index) {
    _activeTabNotifier.value = _bottomTabs.firstWhere((tab) => tab.tabIndex == index);
  }

  @override
  void dispose() {
    _activeTabNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _activeTabNotifier,
      builder: (_, activeTab, __) {
        return Scaffold(
          body: switch (activeTab) {
            NavigationBarTypeEnum.products => const ProductsScreen(),
            NavigationBarTypeEnum.shoppingCart => const ShoppingCartScreen(),
          },
          bottomNavigationBar: BottomNavigationBar(
            items: _bottomTabs
                .map(
                  (tab) => BottomNavigationBarItem(
                    icon: Icon(
                      switch (tab) {
                        NavigationBarTypeEnum.products => Icons.home,
                        NavigationBarTypeEnum.shoppingCart => Icons.shopping_cart,
                      },
                    ),
                    label: '',
                  ),
                )
                .toList(),
            currentIndex: activeTab.tabIndex,
            selectedItemColor: Palette.primary,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}
