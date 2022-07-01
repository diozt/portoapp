import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portapps/app/controllers/sidemenu_controller.dart';
import 'package:portapps/app/ui/page/homepage.dart';
import 'package:portapps/app/ui/widget/homepage/listmenu.dart';

import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class LayoutPage extends StatelessWidget {
  final c = Get.find<SideMenuController>();

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: c.sideMenuKey,
      menu: buildMenu(),
      background: HexColor("FF5733"),
      closeIcon: Icon(
        const IconData(
          0xe16a,
          fontFamily: 'MaterialIcons',
        ),
        color: HexColor('FFFFFF'),
        size: 30,
      ),
      type: SideMenuType.shrinkNSlide,
      onChange: (s) {
        c.stateOpen(c.isOpened);
      },
      child: IgnorePointer(
        ignoring: c.isOpened,
        child: HomePage(),
      ),
    );
  }
}
