import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:portapps/app/controllers/detail_controller.dart';
import 'package:portapps/app/controllers/home_controller.dart';
import 'package:portapps/app/controllers/sidemenu_controller.dart';
import 'package:portapps/app/routes/rout_name.dart';
import 'package:portapps/app/ui/widget/homepage/listwisata.dart';
import 'package:portapps/app/ui/widget/homepage/slider_homepage.dart';
import 'package:portapps/app/ui/widget/homepage/slider_recomendation.dart';
import 'package:portapps/app/ui/widget/homepage/sliderfilter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  final c = Get.find<SideMenuController>();
  final x = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(
      () => x.isLoading.isTrue
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.grey,
                elevation: 0,
                titleSpacing: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/menu.png'),
                      onPressed: () => c.toggleMenu(),
                    ),
                    InkWell(
                      onTap: () => x.getLocation(),
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage('assets/mylocation.png'),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            x.address.value == ''
                                ? 'Your Location'
                                : x.address.value,
                            style: TextStyle(
                              fontSize: 13,
                              color: HexColor('6A778B'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      radius: 100,
                      child: const ClipOval(
                        child: FadeInImage(
                          placeholder:
                              AssetImage('assets/image_placeholder.png'),
                          image: AssetImage('assets/image_placeholder.png'),
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    )
                  ],
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: Text(
                        'Tempat Wisata Terbaru',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w800,
                          color: HexColor('0A2753'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Slider Latest Tourist Spot
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: double.infinity,
                      child: SliderHomepage(size: size, x: x),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    // indicator
                    Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: x.currentIndex.value,
                        count: 10,
                        effect: SwapEffect(
                          activeDotColor: HexColor('FF5733'),
                          type: SwapType.yRotation,
                          dotWidth: 6,
                          dotHeight: 6,
                          dotColor: HexColor('FFD1C7'),
                        ), // your preferred effect
                        onDotClicked: (index) {},
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Rekomendasi",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        height: 135,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(2),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: x.recomendation.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  x.idWisata = x.dataWisata.data[index].id;
                                  Get.toNamed(RoutName.detail);
                                },
                                child: SliderRecomendation(x: x, index: index));
                          },
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // button filter
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 40,
                        child: SliderFilter(x: x),
                      ),
                    ),

                    ResponsiveGridList(
                        scroll: false,
                        desiredItemWidth: 160,
                        minSpacing: 10,
                        children: x.resultFilter.asMap().entries.map((i) {
                          int index = i.key;
                          return InkWell(
                            onTap: () {
                              x.idWisata = x.dataWisata.data[index].id;
                              Get.toNamed(RoutName.detail);
                            },
                            child: ListWisata(x: x, index: index),
                          );
                        }).toList())
                  ],
                ),
              ),
            ),
    );
  }
}
