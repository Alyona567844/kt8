import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kt8/app/data/models/jwt.dart';
import 'package:kt8/app/data/services/api_service.dart';
import 'package:kt8/app/data/services/storage_service.dart';

import '../../core/constants.dart';

class AuthService extends GetxService{
  ApiService apiService = Get.find();
  StorageService storageService = Get.find();

  Dio client = Dio(BaseOptions(baseUrl: Constants.baseUrl));

  Future<void> signUp(String mail, String password) async {
    var response = await client.post(ApiEndpoints.signUp);
    var tokens = JWTModel.fromJson(response.data);
    return;
  }

  bool isAuth = false;
  Future <void> tryAuth() async {
    var refresh = storageService.getRefresh();
    if (refresh != null) {
      bool refreshResult = apiService.updateTokens();
      print(refreshResult);
      isAuth = refreshResult;
    } else {
      isAuth = false;
    }
    Future.delayed(Duration(seconds: 2));
    // storageService.clartStorage();
    // Get.offAllNamed(Routes.LOGIN);
  }
  Future<AuthService> init() async {
    print('tryAuth');
    await tryAuth();
    return this;
  }
}
