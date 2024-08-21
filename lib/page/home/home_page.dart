import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_api_getx/const/colors.dart';
import 'package:news_app_api_getx/const/fonts.dart';
import 'package:news_app_api_getx/controller/news_controller.dart';
import 'package:news_app_api_getx/page/artical/artical_page.dart';
import 'package:news_app_api_getx/page/home/shimmer/shimmer_news_for_you_card.dart';
import 'package:news_app_api_getx/page/home/shimmer/shimmer_trending_card.dart';
import 'package:news_app_api_getx/page/home/widget/business_card.dart';
import 'package:news_app_api_getx/page/trending_details/trending_details_page.dart';
import '../../components/loading_container.dart';
import '../all_articles/all_articles_page.dart';
import 'view_all/view_all_page.dart';
import 'widget/tranding_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  newsController controller = Get.put(newsController());

  @override
  Widget build(BuildContext context) {
    newsController controller = Get.put(newsController());

    return Scaffold(
      /* appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.TrendingNews();
            },
            icon: Icon(Icons.flutter_dash),
          ),
        ],
        centerTitle: true,
        title: Text('GetX'),
      ),*/
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      child: Icon(
                        CupertinoIcons.square_grid_2x2_fill,
                        color: whiteColor,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white.withOpacity(0.3),
                            child: Icon(
                              CupertinoIcons.search,
                              color: whiteColor,
                            ),
                          ),
                          onTap: () {
                            Get.to(
                              ArticalPage(),
                              transition: Transition.fade,
                              duration: Duration(milliseconds: 250),
                            );
                          },
                        ),
                        SizedBox(width: 20),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          child: Icon(
                            CupertinoIcons.mic_fill,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Trending News',
                      style: TextStyle(
                        fontFamily: RobotoR,
                        fontSize: 19,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          ViewAllPage(),
                          transition: Transition.downToUp,
                        );
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          fontFamily: RobotoL,
                          fontSize: 17,
                          color: ActiveBgColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => controller.isTrendingLoading.value
                      ? Row(
                          children: <Widget>[
                            ShimmerTrendingCard(),
                            ShimmerTrendingCard(),
                            ShimmerTrendingCard(),
                          ],
                        )
                      : Row(
                          children: controller.trendingNewsList
                              .map(
                                (e) => TrandingCard(
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
                              .toList(),
                        ),
                ),
              ),
              SizedBox(height: 35),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'All articles',
                      style: TextStyle(
                        fontFamily: RobotoR,
                        fontSize: 19,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View all',
                        style: TextStyle(
                          fontFamily: RobotoL,
                          fontSize: 17,
                          color: ActiveBgColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => controller.isBusinessLoading.value
                    ? Column(
                        children: [
                          ShimmerNewsForYouCard(),
                          ShimmerNewsForYouCard(),
                          ShimmerNewsForYouCard(),
                          ShimmerNewsForYouCard(),
                        ],
                      )
                    : Column(
                        children: controller.businessNewsList
                            .map(
                              (e) => BusinessCard(
                                imageUrl: e.urlToImage ??
                                    "https://media.istockphoto.com/id/1334419989/photo/3d-red-question-mark.jpg?s=612x612&w=0&k=20&c=bpaGVuyt_ACui3xK8CvkeoVQC-jczxANZTMXGKAE11E=",
                                tag: "No 1",
                                time: e.publishedAt!,
                                title: e.title!,
                                author: e.author ?? "Null",
                                ontap: () {
                                  Get.to(
                                    AllArticlesPage(
                                      allArticles: e,
                                    ),
                                    transition: Transition.downToUp,
                                  );
                                },
                              ),
                            )
                            .toList(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// API key - ec8dc9fd271f40dd83884d8f74381b85
