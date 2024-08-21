import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_api_getx/components/loading_container.dart';

class ShimmerNewsForYouCard extends StatelessWidget {
  const ShimmerNewsForYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
      child: Row(
        children: <Widget>[
          LoadingContainer(width: 100, hight: 100),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoadingContainer(width: 234, hight: Get.height * 0.1 - 72),
              SizedBox(height: 10),
              LoadingContainer(
                  width: Get.width * .2, hight: Get.height * 0.1 - 72),
            ],
          ),
        ],
      ),
    );
  }
}
