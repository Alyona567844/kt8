import 'package:get/get.dart';
import 'package:kt8/app/data/services/api_service.dart';
import 'package:kt8/app/data/services/auth_service.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  ApiService apiService = Get.find();
  AuthService authService = Get.find();
  void logout() {
    apiService.logout();
  }
}
