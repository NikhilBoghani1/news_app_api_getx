import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_api_getx/page/home/home_page.dart';
import 'package:news_app_api_getx/page/home/shimmer/shimmer_trending_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Material App',
      // home: ShimmerTrendingCard(),
      home: HomePage(),
    );
  }
}
