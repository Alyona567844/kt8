import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.assignment_ind,
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
              'Registration',
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
              height: 20,
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                style: TextStyle(color: const Color.fromARGB(255, 87, 207, 91)),
                controller: controller.passRepController,
                decoration: const InputDecoration(
                    hintText: "Repeat password",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 87, 207, 91)))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 45,
              width: 90,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 86, 35, 168)),
                  onPressed: () => controller.registration(),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 87, 207, 91),
                      fontSize: 15,
                    ),
                  )),
            ),
          ],
        ),
      )),
      backgroundColor: Color.fromARGB(255, 118, 71, 203),
    );
  }
}
