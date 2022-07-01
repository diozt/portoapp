import 'package:get/get.dart';
import 'package:portapps/app/controllers/detail_controller.dart';
import 'package:portapps/app/controllers/home_controller.dart';
import 'package:portapps/app/controllers/maps_controller.dart';
import 'package:portapps/app/controllers/sidemenu_controller.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SideMenuController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DetailController>(() => DetailController(), fenix: true);
    Get.lazyPut<MapController>(() => MapController());
  }
}
