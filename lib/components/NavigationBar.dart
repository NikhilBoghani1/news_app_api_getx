import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_navigation_controller.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 220,
          height: 60,
          decoration: BoxDecoration(
            // color: BottomNavColor,
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.index.value = 0;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    curve: Curves.bounceInOut,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: controller.index.value == 0
                          ? Colors.black.withOpacity(0.1)
                          : null,
                    ),
                    width: 45,
                    height: 45,
                    child: Center(
                      child: Icon(
                        CupertinoIcons.home,
                        color:
                            controller.index.value == 0 ? Colors.white : null,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.index.value = 1;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    curve: Curves.bounceInOut,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: controller.index.value == 1
                          ? Colors.black.withOpacity(0.1)
                          : null,
                    ),
                    width: 45,
                    height: 45,
                    child: Center(
                      child: Icon(
                        CupertinoIcons.search,
                        color:
                            controller.index.value == 1 ? Colors.white : null,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.index.value = 2;
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 350),
                    curve: Curves.bounceInOut,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: controller.index.value == 2
                          ? Colors.black.withOpacity(0.1)
                          : null,
                    ),
                    width: 45,
                    height: 45,
                    child: Center(
                      child: Icon(
                        CupertinoIcons.settings,
                        color:
                            controller.index.value == 2 ? Colors.white : null,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
