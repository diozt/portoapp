import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portapps/app/controllers/home_controller.dart';

class SliderFilter extends StatelessWidget {
  const SliderFilter({
    Key? key,
    required this.x,
  }) : super(key: key);

  final HomeController x;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: x.listCategory.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Align(
            alignment: Alignment.center,
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                x.filter(x.listCategory[index]);
              },
              child: Container(
                margin: EdgeInsets.only(right: 5),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    boxShadow: [
                      x.nameCategory.value == x.listCategory[index]
                          ? BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            )
                          : BoxShadow()
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: x.nameCategory.value == x.listCategory[index]
                        ? HexColor('E52900')
                        : Colors.white,
                    border: Border.all(
                      color: HexColor('E52900'),
                    )),
                child: Text(
                  index == 0
                      ? "" + x.listCategory[index]
                      : "Wisata " + x.listCategory[index],
                  style: TextStyle(
                    color: x.nameCategory.value == x.listCategory[index]
                        ? Colors.white
                        : HexColor('E52900'),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
