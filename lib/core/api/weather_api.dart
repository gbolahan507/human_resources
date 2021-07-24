import 'package:dio/dio.dart';
import 'package:human_resources/core/api/base_api.dart';
import 'package:human_resources/core/model/weather.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';



class WeatherApi extends BaseAPI {
  Logger log = Logger();

  DateTime date = DateTime.now();

  Future<Weathers> getWeather2() async {
    try {
      Response<Map> response =
          await Dio().get("$baseUrl", options: defaultOptions);
      log.d(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.data;
        var current = res;
        print(current);
        Weathers currentTemp = Weathers(
          zone: current["timezone"],
          description: current["current"]['weather'][0]["description"],
          current: current["current"]["temp"]?.round() ?? 0,
          humidity: current["current"]["humidity"],
          wind: current["current"]["wind_speed"],
          uv: current["current"]["uvi"],
          image: current["current"]["weather"][0]["main"].toString(),
        );
        return currentTemp;
      }
    } catch (e) {}
    return null;
  }

  Future<List> getsevendaysWeather2() async {
    List<Weathers> sevenDay = [];
    try {
      var response = await Dio().get("$baseUrl", options: defaultOptions);
      if (response.statusCode == 200) {
        for (var i = 1; i < 8; i++) {
          String day = DateFormat("EEEE")
              .format(DateTime(date.year, date.month, date.day + i + 1))
              .substring(0, 3);
          var res = response.data;
          var daily = res["daily"][i];
          var hourly = Weathers(
              max: daily["temp"]["max"]?.round() ?? 0,
              min: daily["temp"]["min"]?.round() ?? 0,
              image: daily["weather"][0]["main"].toString(),
              description: daily["weather"][0]["description"].toString(),
              day: day);
          sevenDay.add(hourly);
        }
        return sevenDay;
      }
    } catch (e) {}
    return null;
  }
}
