import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_shop/data/utilities/network/api/api_products.dart';
import 'package:online_shop/data/utilities/network/interceptor/app_log_interceptor.dart';

/// App api client
@Injectable()
class ApiClient {
  /// Default constructor
  ApiClient();

  /// Api products
  ApiProducts get apiProducts => ApiProducts(_dio());

  Dio _dio() => Dio(baseOptions)
    ..interceptors.addAll([
      AppLogInterceptor(),
    ]);

  /// Api base option
  static BaseOptions get baseOptions => BaseOptions(
        baseUrl: 'https://dummyjson.com/',
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 100),
        connectTimeout: const Duration(seconds: 100),
        followRedirects: false,
        headers: {'Content-Type': 'application/json'},
        validateStatus: (status) {
          return status! <= 511;
        },
      );
}
