import 'package:flutter/material.dart';
import 'package:portapps/app/controllers/home_controller.dart';

class ListWisata extends StatelessWidget {
  const ListWisata({
    Key? key,
    required this.x,
    required this.index,
  }) : super(key: key);

  final HomeController x;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
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
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: const AssetImage('assets/image_placeholder.png'),
                image: NetworkImage(
                  x.resultFilter[index].thumbnail,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          // title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              x.resultFilter[index].caption,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(
            height: 2,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.red,
                  size: 10,
                ),
                Expanded(
                  child: Text(
                    x.resultFilter[index].location,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // rating
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 10,
                ),
                const SizedBox(
                  width: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    x.resultFilter[index].rating +
                        " (" +
                        x.resultFilter[index].monthly_visitor +
                        " Pengunjung/Bulan)",
                    style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
