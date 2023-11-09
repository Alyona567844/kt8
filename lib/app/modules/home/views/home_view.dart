import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomeView',
          style: TextStyle(color: const Color.fromARGB(255, 87, 207, 91)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => controller.logout(),
              icon: const Icon(
                Icons.logout,
                color: const Color.fromARGB(255, 87, 207, 91),
              ))
        ],
        backgroundColor: Color.fromARGB(255, 86, 35, 168),
      ),
      body: Center(
        child: Obx(() => Text(
              controller.welcometext.value,
              style: TextStyle(
                  fontSize: 20, color: const Color.fromARGB(255, 87, 207, 91)),
            )),
      ),
      backgroundColor: Color.fromARGB(255, 118, 71, 203),
    );
  }
}
