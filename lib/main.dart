import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/data/services/api_service.dart';
import 'app/data/services/auth_service.dart';
import 'app/data/services/storage_service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
Future<void> initServices() async{
  await Get.putAsync(() async => StorageService());
  await Get.putAsync(() async => AuthService());
  await Get.putAsync(() async => ApiService());
}