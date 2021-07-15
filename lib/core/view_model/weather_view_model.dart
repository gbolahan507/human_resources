import 'package:human_resources/core/api/weather_api.dart';
import 'package:human_resources/core/model/weather_model.dart';
import 'package:human_resources/core/model/weekly.dart';
import 'package:human_resources/core/model/weekly_model.dart';
import 'package:human_resources/core/storage/local_storage.dart';
import 'package:human_resources/util/constant/locator.dart';
import 'package:human_resources/util/error/custom_exception.dart';
import 'base_vm.dart';

class WeatherViewModel extends BaseModel {
  final WeatherApi _weatherApi = locator<WeatherApi>();
  String error1;
  String error2;
  String error3;
  String token;

  WeatherModel weatherModel;
  List<WeeklyWeather> sevendays;
  List<DailyModel> dailyModel;


  Future<void> getWeather() async {
    setBusy(true);
    try {
      weatherModel = await _weatherApi.getWeather();
      AppCache.saveTimeZone(weatherModel.timezone);
      setBusy(false);
      notifyListeners();
    } on CustomException catch (e) {
      error2 = e.message;
      setBusy(false);
      showErrorDialog(e);
      notifyListeners();
    }
  }

  Future<void> getsevendaysWeather() async {
    setBusy(true);
    try {
      dailyModel = await _weatherApi.getsevendaysWeather();
      setBusy(false);
      notifyListeners();
    } on CustomException catch (e) {
      error2 = e.message;
      setBusy(false);
      showErrorDialog(e);
      notifyListeners();
    }
  }

 

  void showErrorDialog(CustomException e) {
    dialog.showDialog(
        title: 'Error', description: e.message, buttonTitle: 'Close');
  }
}
