import 'dart:io';

import 'package:dio/dio.dart';

import '../base/locator.dart';
import '../base/https.dart';

class ApiBaseHelper {
  API api = locator<API>();

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await api.dio.get(url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
      case 403:
        throw BadRequestException();
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
