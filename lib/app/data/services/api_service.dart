import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kt8/app/data/services/storage_service.dart';

import '../../core/constants.dart';
import '../../routes/app_pages.dart';

class ApiService extends GetxService{
  StorageService storageService = Get.find();
  Dio client = Dio(BaseOptions(baseUrl: Constants.baseUrl));
  bool updateTokens() {
    return false;
  }

  void logout(){
    storageService.clear();
    Get.offNamed(Routes.LOGIN);
  }

  Future<ApiService> init() async {
    return this;
  }
}