import 'package:get/get.dart';
import 'package:kt8/app/data/services/api_service.dart';
import 'package:kt8/app/data/services/auth_service.dart';


class HomeController extends GetxController {
  ApiService apiService = Get.find();
  AuthService authService = Get.find();
  
  Future<void> getUser() async {
    var res = await apiService.getUser();
    welcometext.value=res;
  }
  RxString welcometext = "".obs;

  void logout() {
    authService.logout();
  }
  @override
  void onReady() {
    getUser();
    super.onReady();
  }
}
