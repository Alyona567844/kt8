import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegistrationView'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(Constants.defaultPadding),
            child: Column(
                  children: [
            const Text(
              'Registration',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.mailController,
              decoration: const InputDecoration(hintText: "mail"),
            ),
            TextField(
              controller: controller.passController,
              decoration: const InputDecoration(hintText: "password"),
            ),
            TextField(
              controller: controller.passRepController,
              decoration: const InputDecoration(hintText: "repeat password"),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () => controller.registration(),
                child: const Text('Sign up'))
                  ],
                ),
          )),
    );
  }
}
