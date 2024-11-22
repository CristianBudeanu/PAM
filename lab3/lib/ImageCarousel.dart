import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lab2/controllers/wine_controller.dart';
import 'package:lab2/models/wine.dart';

// class ImageCarousel extends StatelessWidget {
//   const ImageCarousel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       items: [
//         // Custom Wine Card 1
//         wineCard('123', 'Red wines', '/lib/assets/wine1.jpg'),
//         // Custom Wine Card 2
//         wineCard('456', 'White wines', '/lib/assets/wine1.jpg'),
//         // Custom Wine Card 3
//         wineCard('789', 'Rose wines', '/lib/assets/wine1.jpg'),
//       ],
//       options: CarouselOptions(
//         height: 150.0,
//         aspectRatio: 16 / 9,
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enableInfiniteScroll: true,
//         viewportFraction: 0.4,
//       ),
//     );
//   }

//   Widget wineCard(String number, String label, String imageUrl) {
//     return Container(
//       margin: const EdgeInsets.all(6.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             offset: Offset(2, 2),
//             blurRadius: 6,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(17),
//                   topRight: Radius.circular(10),
//                 ),
//                 child: Image.network(
//                   imageUrl,
//                   height: 100.0,
//                   width: double.infinity,
//                 ),
//               ),
//                 Positioned(
//                       right: 0,
//                       top: 0,
//                       child: ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           topRight: Radius.circular(10),
//                           bottomLeft: Radius.circular(17),
//                         ),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 2),
//                           color: const Color.fromARGB(255, 158, 0, 0),
//                           child: Text(
//                             number,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               label,
//               style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final WineController controller = Get.find(); // Access the WineController

    return Obx(() {
      // Use Obx to rebuild when wines list is updated
      if (controller.wines.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return CarouselSlider(
        items: controller.wines.map((wine) => wineCard(wine)).toList(),
        options: CarouselOptions(
          height: 150.0,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          viewportFraction: 0.4,
        ),
      );
    });
  }

  Widget wineCard(Wine wine) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevents taking up unnecessary space
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  wine.image,
                  height: 80.0, // Reduced height to fit content
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(17),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    color: const Color.fromARGB(255, 158, 0, 0),
                    child: Text(
                      wine.criticScore.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            // Flexible to avoid overflow
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                wine.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
