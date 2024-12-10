import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:online_shop/data/utilities/injection/injection.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Instance of [GetIt]
final locator = GetIt.instance;

/// Configures getIt dependencies
@InjectableInit(asExtension: false)
Future<GetIt> configureDependencies() async {
  locator.registerSingleton(SharedPreferencesAsync());
  return init(locator, environment: devInject.name);
}

/// Dev env for injectable
const devInject = Environment('dev');

/// Test env for injectable
const testInject = Environment('test');
