import 'package:get/get.dart';
import 'package:portapps/app/routes/rout_name.dart';
import 'package:portapps/app/ui/page/detail.dart';
import 'package:portapps/app/ui/page/layout.dart';
import 'package:portapps/app/ui/page/mapscreen.dart';
import 'package:portapps/app/ui/page/profile.dart';
import 'package:portapps/app/ui/page/splashscreen.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RoutName.splash,
      page: () => SplashScreen(),
      // binding: LoginBinding(),
    ),

    GetPage(
      name: RoutName.home,
      page: () => LayoutPage(),
      // binding: LoginBinding(),
    ),

    // GetPage(
    //   name: RoutName.login,
    //   page: () => LoginPage(),
    //   // binding: LoginBinding(),
    // ),

    GetPage(
      name: RoutName.detail,
      page: () => DetailPage(),
      // binding: LoginBinding(),
    ),

    GetPage(
      name: RoutName.profile,
      page: () => ProfilePage(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: RoutName.direction,
      page: () => MapScreen(),
      // binding: LoginBinding(),
    ),
  ];
}
