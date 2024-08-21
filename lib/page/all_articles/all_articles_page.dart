import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_api_getx/const/fonts.dart';
import 'package:news_app_api_getx/model/Articles.dart';

class AllArticlesPage extends StatelessWidget {
  final Articles allArticles;

  const AllArticlesPage({super.key, required this.allArticles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Icon(CupertinoIcons.left_chevron),
                    Text(
                      'Back',
                      style: TextStyle(fontFamily: RobotoM, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(allArticles.urlToImage ??
                      "https://media.istockphoto.com/id/1334419989/photo/3d-red-question-mark.jpg?s=612x612&w=0&k=20&c=bpaGVuyt_ACui3xK8CvkeoVQC-jczxANZTMXGKAE11E="),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                allArticles.title!,
                style: TextStyle(
                  fontFamily: RobotoM,
                  fontSize: 19,
                  height: 1.8,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontFamily: RobotoM,
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    allArticles.publishedAt!,
                    style: TextStyle(
                      fontFamily: RobotoM,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  SizedBox(width: 15),
                  Text(
                    'N E W S',
                    style: TextStyle(
                      fontFamily: RobotoM,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Text(
                      allArticles.author![0],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    radius: 18,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      allArticles.author ?? "Unknow",
                      style: TextStyle(
                        fontFamily: RobotoM,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                allArticles.description!,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: RobotoM,
                  height: 1.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
