import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kt8/app/data/models/jwt.dart';
import 'package:kt8/app/data/services/api_service.dart';
import 'package:kt8/app/data/services/storage_service.dart';

import '../../core/constants.dart';

class AuthService extends GetxService {
  ApiService apiService = Get.find();
  StorageService storageService = Get.find();
  late JWTModel _tokens;

  Dio client = Dio(BaseOptions(baseUrl: Constants.baseUrl));
  Future<bool> refresh() async{
    try{
    var res = await client.post(ApiEndpoints.refresh, data: _tokens.toJson());
    var tokens = JWTModel.fromJson(res.data);
    updateTokens(tokens);
    if(res.statusCode == 200) return true;
    }catch(e) {
      print(e);
    }
    return false;
  }

  Future<bool> auth(String email, String password) async =>
      _signIn(email, password, ApiEndpoints.signIn);
  Future<bool> signup(String email, String password) async =>
      _signIn(email, password, ApiEndpoints.signUp);
  Future<bool> _signIn(String email, String password, String path) async {
    try {
      var response = await client.post(path, data: {
        "email": email,
        "password": password,
      });
      var tokens = JWTModel.fromJson(response.data);
      updateTokens(tokens);
      if (response.statusCode == 200) return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> signUp(String email, String password) async {
    try {
      var response = await client.post(ApiEndpoints.signUp, data: {
        "email": email,
        "password": password,
      });
      var tokens = JWTModel.fromJson(response.data);
      updateTokens(tokens);
      print(tokens);
      if (response.statusCode == 200) return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  bool isAuth = false;
  Future<void> updateTokens(JWTModel tokens) async {
    _tokens = tokens;
    storageService.writeRefresh(tokens.refreshToken);
  }

  Future<void> tryAuth() async {
    String refreshToken = storageService.getRefresh();
    var tokens = JWTModel(null, refreshToken);
    if (tokens.refreshToken != null) {
      bool refreshResult = apiService.updateTokens();
      print(refreshResult);
      isAuth = refreshResult;
    } else {
      isAuth = false;
    }
    // Future.delayed(Duration(seconds: 2));
    // storageService.clartStorage();
    // Get.offAllNamed(Routes.LOGIN);
  }

  Future<AuthService> init() async {
    await tryAuth();
    return this;
  }
}
