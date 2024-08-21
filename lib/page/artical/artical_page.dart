import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_api_getx/const/fonts.dart';
import 'package:news_app_api_getx/controller/news_controller.dart';
import 'package:news_app_api_getx/page/all_articles/all_articles_page.dart';
import 'package:news_app_api_getx/page/home/shimmer/shimmer_news_for_you_card.dart';
import 'package:news_app_api_getx/page/home/widget/business_card.dart';

class ArticalPage extends StatefulWidget {
  const ArticalPage({super.key});

  @override
  State<ArticalPage> createState() => _ArticalPageState();
}

class _ArticalPageState extends State<ArticalPage> {
  newsController controller = Get.put(newsController());
  TextEditingController Searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Artical',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: Searchcontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(CupertinoIcons.search),
                          hintText: "Search artical",
                          hintStyle: TextStyle(
                            fontFamily: RobotoM,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Obx(
                      () => controller.isNewsForULoading.value
                          ? Container(
                              width: 48,
                              height: 48,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                controller.searchNews(Searchcontroller.text);
                              },
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.article,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'recent searches',
                      style: TextStyle(
                        fontFamily: RobotoM,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'clear all',
                      style: TextStyle(
                        fontFamily: RobotoM,
                        fontSize: 17,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
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
                  children: controller.newsForYouList
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
