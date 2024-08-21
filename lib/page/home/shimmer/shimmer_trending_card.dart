import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_api_getx/components/loading_container.dart';
import 'package:news_app_api_getx/const/colors.dart';
import 'package:news_app_api_getx/const/fonts.dart';

class ShimmerTrendingCard extends StatelessWidget {
  const ShimmerTrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: 280,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          LoadingContainer(
            width: Get.width,
            hight: Get.height,
          ),
          // Content on top of the shadow
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    LoadingContainer(
                      hight: Get.height * .1 - 72,
                      width: Get.width * .4,
                    ),
                    SizedBox(width: 8),
                    LoadingContainer(
                      hight: 15,
                      width: 15,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                LoadingContainer(
                  hight: Get.height * .1 - 72,
                  width: Get.width * .2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
