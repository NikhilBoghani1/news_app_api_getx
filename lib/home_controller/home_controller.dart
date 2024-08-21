import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/NavigationBar.dart';
import '../controller/bottom_navigation_controller.dart';

class HomeController extends StatelessWidget {
  const HomeController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      floatingActionButton: Navigationbar(),
      body: Obx(
        () => controller.pages[controller.index.value],
      ),
    );
  }
}
