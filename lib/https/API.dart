import 'package:dio/dio.dart';

import '../base/utils.dart';

class API {
  Dio dio;

  API() {
    // Set Default configs
    BaseOptions options = new BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = new Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}
