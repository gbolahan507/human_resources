import 'package:flutter/material.dart';
import 'package:human_resources/ui/onboard/splash_screen.dart';
import 'package:human_resources/ui/screen/home_screen.dart';
import 'package:human_resources/ui/screen/weekly.dart';
import 'package:human_resources/util/constant/locator.dart';
import 'package:human_resources/util/dialog_manager.dart';
import 'package:human_resources/util/dialog_service.dart';
import 'package:human_resources/util/navigator.dart';
import 'package:human_resources/util/router.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/storage/local_storage.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCache.init(); //Initialize Hive for Flutter
  setupLocator();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: allProviders,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme:
                  GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
              primaryColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: SplashScreen(),
          builder: (BuildContext context, Widget child) => Navigator(
              key: locator<DialogService>().dialogNavigationKey,
              onGenerateRoute: (RouteSettings settings) =>
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          DialogManager(child: child))),
          navigatorKey: locator<NavigationService>().navigationKey,
          onGenerateRoute: generateRoute,
        ));
  }
}
