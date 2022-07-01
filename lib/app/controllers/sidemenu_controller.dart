import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class SideMenuController extends GetxController {
  bool isOpened = false;
  var selectedIdex = 0.obs;

  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> endSideMenuKey = GlobalKey<SideMenuState>();

  void tappedIndex(int index) {
    selectedIdex.value = index;
  }

  stateOpen(opened) {
    opened = !opened;
  }

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }
}
