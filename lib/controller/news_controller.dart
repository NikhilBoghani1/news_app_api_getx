import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_api_getx/model/Articles.dart';

class newsController extends GetxController {
  @override
  void onInit() {
    TrendingNews();
    businessNews();
    super.onInit();
  }

  RxList<Articles> trendingNewsList = <Articles>[].obs;
  RxList<Articles> businessNewsList = <Articles>[].obs;
  RxList<Articles> newsForYouList = <Articles>[].obs;
  RxBool isTrendingLoading = false.obs;
  RxBool isBusinessLoading = false.obs;
  RxBool isNewsForULoading = false.obs;

  // Trending News API

  Future<void> TrendingNews() async {
    isTrendingLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ec8dc9fd271f40dd83884d8f74381b85";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          trendingNewsList.add(Articles.fromJson(news));
        }
      } else {
        print("--- Error ---");
      }
    } catch (ex) {
      print(ex.toString());
    }
    print(trendingNewsList);
    isTrendingLoading.value = false;
  }

  Future<void> businessNews() async {
    isBusinessLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=ec8dc9fd271f40dd83884d8f74381b85";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          businessNewsList.add(Articles.fromJson(news));
        }
      } else {
        print("--- Error ---");
      }
    } catch (ex) {
      print(ex.toString());
    }
    // print(businessNewsList);
    isBusinessLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    isNewsForULoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=$search&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        newsForYouList.clear();
        int i = 0;
        for (var news in articals) {
          i++;
          newsForYouList.add(Articles.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForULoading.value = false;
  }

/*Future<void> businessNews() async {
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ec8dc9fd271f40dd83884d8f74381b85";
    var response = await http.get(Uri.parse(baseUrl));
    print(response);
    if (response.statusCode == 200) {
      print(response.body);
      var body = jsonDecode(response.body);
      var articals = body["articles"];
      for (var news in articals) {
        businessNewsList.add(
          Articles.fromJson(news),
        );
      }
    }
    print(businessNewsList);
  }*/
}
