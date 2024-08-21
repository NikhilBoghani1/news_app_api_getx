import 'package:get/get.dart';
import 'package:news_app_api_getx/page/artical/artical_page.dart';
import 'package:news_app_api_getx/page/home/home_page.dart';
import 'package:news_app_api_getx/page/settings/settings_page.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    HomePage(),
    ArticalPage(),
    SettingsPage(),
  ];
}
