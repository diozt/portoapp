import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portapps/app/controllers/home_controller.dart';

class SliderRecomendation extends StatelessWidget {
  const SliderRecomendation({
    Key? key,
    required this.x,
    required this.index,
  }) : super(key: key);

  final HomeController x;
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 83,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage(
                placeholder: const AssetImage('assets/image_placeholder.png'),
                image: NetworkImage(
                  x.recomendation[index].thumbnail,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(
            height: 7,
          ),

          // title
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                x.recomendation[index].caption,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 2,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.red,
                  size: 11,
                ),
                Expanded(
                  child: Text(
                    x.recomendation[index].location,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // rating
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 9,
                ),
                const SizedBox(
                  width: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    x.recomendation[index].rating +
                        " (" +
                        x.recomendation[index].monthly_visitor +
                        " Pengunjung/bulan)",
                    style: const TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
