import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portapps/app/controllers/home_controller.dart';
import 'package:portapps/app/routes/rout_name.dart';

class SliderHomepage extends StatelessWidget {
  const SliderHomepage({
    Key? key,
    required this.size,
    required this.x,
  }) : super(key: key);

  final Size size;
  final HomeController x;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(10, (idx) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                x.idWisata = x.dataWisata.data[idx].id;
                Get.toNamed(RoutName.detail);
              },
              child: AnimatedContainer(
                // curve: Curves.easeInExpo,
                duration: const Duration(seconds: 2),
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: FadeInImage(
                          placeholder:
                              const AssetImage('assets/image_placeholder.png'),
                          image: NetworkImage(
                            x.dataWisata.data[idx].image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.8),
                                Colors.black,
                              ]),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          x.dataWisata.data[idx].caption,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 8),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          x.setState(index);
        },
      ),
    );
  }
}
