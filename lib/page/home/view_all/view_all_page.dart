import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_api_getx/page/home/view_all/widget/view_all_card.dart';
import 'package:news_app_api_getx/page/trending_details/trending_details_page.dart';

import '../../../controller/news_controller.dart';
import '../widget/tranding_card.dart';

class ViewAllPage extends StatefulWidget {
  const ViewAllPage({super.key});

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  newsController controller = Get.put(newsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 60),
          child: Center(
            child: Column(
                children: controller.trendingNewsList
                    .map(
                      (e) => ViewAllCard(
                        imageUrl: e.urlToImage!,
                        tag: "Tranding no 1",
                        time: e.publishedAt!,
                        title: e.title!,
                        author: e.author!,
                        ontap: () {
                          Get.to(
                            TrendingDetailsPage(newsModel: e),
                            transition: Transition.downToUp,
                          );
                        },
                      ),
                    )
                    .toList()),
          ),
        ),
      ),
    );
  }
}
