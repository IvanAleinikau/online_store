import 'package:auto_route/auto_route.dart';
import 'package:online_shop/presentation/utils/navigation/app_router.gr.dart';

/// App Router Class
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          initial: true,
        ),
        AutoRoute(
          page: ProductRoute.page,
          path: '/product',
        ),
      ];
}
