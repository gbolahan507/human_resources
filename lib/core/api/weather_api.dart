import 'package:dio/dio.dart';
import 'package:human_resources/core/api/base_api.dart';
import 'package:human_resources/core/model/error_model.dart';
import 'package:human_resources/core/model/weather_model.dart';
import 'package:human_resources/core/model/weekly.dart';
import 'package:human_resources/core/model/weekly_model.dart';
import 'package:human_resources/util/constant/messages.dart';
import 'package:human_resources/util/error/custom_exception.dart';
import 'package:human_resources/util/error/error_util.dart';
import 'package:logger/logger.dart';

class WeatherApi extends BaseAPI {
  Logger log = Logger();

  List<WeeklyWeather> sevendays;

  WeatherModel weatherModel;
  DateTime date = DateTime.now();

  Future<WeatherModel> getWeather() async {
    try {
      var response = await Dio().get("$baseUrl", options: defaultOptions);
      log.d(response.statusCode);
      switch (response.statusCode) {
        case SERVER_OKAY:
          return WeatherModel.fromJson(response.data);
          break;
        default:
          throw ErrorModel.fromJson(response.data).cod;
          break;
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<List<DailyModel>> getsevendaysWeather() async {
    List<DailyModel> data = <DailyModel>[];
    try {
      var response = await Dio().get("$baseUrl", options: defaultOptions);
      log.d(response.statusCode);

      if (response.statusCode == 200) {
        data = (response.data["daily"] as List)
            .map((e) => DailyModel.fromJson(e))
            .toList();

        // data.removeLast();
        return data;
      } else {
        throw ErrorModel.fromJson(response.data).cod;
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }
}
