import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.account_circle,
              color: const Color.fromARGB(255, 87, 207, 91),
            ),
            onPressed: () {})
      ], backgroundColor: Color.fromARGB(255, 86, 35, 168)),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(Constants.defaultPadding),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Login',
              style: TextStyle(
                  fontSize: 30, color: const Color.fromARGB(255, 87, 207, 91)),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                style: TextStyle(color: const Color.fromARGB(255, 87, 207, 91)),
                controller: controller.mailController,
                decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 87, 207, 91)))),
              ),
            ),
            const SizedBox(
              height: 20,

            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                style: TextStyle(color: const Color.fromARGB(255, 87, 207, 91)),
                controller: controller.passController,
                decoration: const InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 87, 207, 91)))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 35,
              width: 70,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 86, 35, 168)),
                  onPressed: () => controller.login(),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 87, 207, 91),
                      fontSize: 15,
                    ),
                  )),
            ),
            TextButton(
                onPressed: () => controller.toRegistration(),
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 87, 207, 91),
                      fontSize: 20),
                ))
          ],
        ),
      )),
      backgroundColor: Color.fromARGB(255, 118, 71, 203),
    );
  }
}
