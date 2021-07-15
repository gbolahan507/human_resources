import 'package:dio/dio.dart';
import 'package:human_resources/util/constant/locator.dart';
import 'package:human_resources/util/constant/messages.dart';
import 'package:human_resources/util/navigator.dart';


class BaseAPI {
  Dio dio = Dio();

  String baseUrl = kBaseUrl;
  Options defaultOptions = Options(
      sendTimeout: 20000, // 20 seconds
      receiveTimeout: 20000, // 20 seconds
      // contentType: 'application/json',
      validateStatus: (status) => status < 500);
  NavigationService navigate = locator<NavigationService>();
}


