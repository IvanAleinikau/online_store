import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/utilities/bloc/bloc_factory.dart';
import 'package:online_shop/data/utilities/injection/injection.dart';
import 'package:online_shop/presentation/utils/navigation/app_router.dart';
import 'package:provider/provider.dart';

/// Application class
class Application extends StatefulWidget {
  /// Default constructor
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider(
          create: (context) => BlocFactory(getIt: locator),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        theme: ThemeData(
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(
                allowEnterRouteSnapshotting: false,
              ),
            },
          ),
        ),
      ),
    );
  }
}
