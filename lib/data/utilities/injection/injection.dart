import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:online_shop/data/utilities/injection/injection.config.dart';

/// Instance of [GetIt]
final locator = GetIt.instance;

/// Configures getIt dependencies
@InjectableInit(asExtension: false)
Future<void> configureDependencies() async => init(locator, environment: devInject.name);

/// Dev env for injectable
const devInject = Environment('dev');

/// Test env for injectable
const testInject = Environment('test');
