import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kt8/app/data/services/auth_service.dart';

class RegistrationController extends GetxController {
  AuthService authService = Get.find();
  var mailController = TextEditingController();
  var passController = TextEditingController();
  var passRepController = TextEditingController();

  void registration() {
    if (passController.text != passRepController.text) {
      showError("Password is uncorrect");
      return;
    }
    if (passController.text.length < 8) {
      showError("Password length must be longer than 8 letters");
      return;
    }
    if (!mailController.text.contains("@")) {
      showError("Invalid mail");
      return;
    }
  }
  void trySignUn(String mail, String password) => authService.signUp(mail,password);

  void showError(
    String message,
  ) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 1),
    ));
  }
}
