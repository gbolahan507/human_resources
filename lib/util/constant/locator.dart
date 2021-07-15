import 'package:get_it/get_it.dart';
import 'package:human_resources/core/api/weather_api.dart';
import 'package:human_resources/core/view_model/startup_vm.dart';
import 'package:human_resources/core/view_model/weather_view_model.dart';
import 'package:human_resources/util/dialog_service.dart';
import 'package:human_resources/util/navigator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';





GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());



  locator.registerFactory(() => StartUpViewModel());


  locator.registerLazySingleton(() => WeatherApi());
  locator.registerFactory(() => WeatherViewModel());


}

final List<SingleChildWidget> allProviders = <SingleChildWidget>[
  ChangeNotifierProvider<WeatherViewModel>(create: (_) => WeatherViewModel()),


];
