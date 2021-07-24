import 'package:human_resources/core/storage/local_storage.dart';
import 'package:human_resources/util/constant/routes.dart';
import 'base_vm.dart';

class StartUpViewModel extends BaseModel {
  bool hasLoggedIn = false;

  Future<void> isLoggedIn() async {
    final String token = AppCache.getTimeZone();
    if (token != null ) {
      hasLoggedIn = true;
      Future<void>.delayed(const Duration(seconds: 2), () {
        navigate.navigateToReplacing(LandPageView);
      });
    } else
      Future<void>.delayed(const Duration(seconds: 2), () {
        navigate.navigateToReplacing(BottomNavView);
      });

    notifyListeners();
  }
}
