import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kt8/app/data/services/auth_service.dart';

import '../../../routes/app_pages.dart';

class RegistrationController extends GetxController {
  AuthService authService = Get.find();
  var mailController = TextEditingController();
  var passController = TextEditingController();
  var passRepController = TextEditingController();

  void registration() async {
    if (passController.text != passRepController.text) {
      showSnack("Password is uncorrect");
      return;
    }
    if (passController.text.length < 8) {
      showSnack("Password length must be longer than 8 letters");
      return;
    }
    if (!mailController.text.contains("@")) {
      showSnack("Invalid email");
      return;
    }
    bool res = await authService.signup(mailController.text, passController.text);
    if(res) {
      authService.isAuth = true;
      Get.toNamed(Routes.HOME);
      showSnack("Registration is successfull", isError: false);
    } else {
      showSnack('Registration falled');
    }
  }
  void showSnack(
    String message, {isError = true}
  ) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: isError? Colors.red: Colors.green,
      duration: const Duration(seconds: 1),
    ));
  }
}
