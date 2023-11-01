import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';

class ApiService extends GetxService{

  Dio client = Dio(BaseOptions(baseUrl: Constants.baseUrl));
  bool updateTokens() {
    return false;
  }
  Future<ApiService> init() async {
    return this;
  }
}