import 'package:get/get.dart';
import 'package:kt8/app/data/services/api_service.dart';

import '../../../data/services/auth_service.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  
  AuthService authService = Get.find();

  @override
  void onReady() async {
    super.onReady();
    await authService.tryAuth();
    if (authService.isAuth) {
      Get.offAllNamed(Routes.HOME);
    }
    else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
