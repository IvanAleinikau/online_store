import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Log Interceptor for log api calls
class AppLogInterceptor extends PrettyDioLogger {
  /// Default constructor
  AppLogInterceptor({
    super.requestBody,
    super.requestHeader,
    super.responseHeader,
    super.responseBody = false,
  });
}
