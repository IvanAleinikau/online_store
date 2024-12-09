/// Navigation Type Enum
enum NavigationBarTypeEnum {
  /// Products type
  products(tabIndex: 0),

  /// Shopping cart
  shoppingCart(tabIndex: 1);

  const NavigationBarTypeEnum({required this.tabIndex});

  /// Tab index
  final int tabIndex;
}
