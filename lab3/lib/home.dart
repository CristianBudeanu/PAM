import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab2/ImageCarousel.dart';
import 'package:lab2/WineBox.dart';
import 'package:lab2/controllers/wine_controller.dart';
import 'package:lab2/header.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final WineController wineController = Get.put(WineController());

//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const Header(),
//                 const ImageCarousel(),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Wine',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // Navigate or handle "view all" action here
//                         },
//                         child: const Text(
//                           'view all',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Obx(() => Column(
//                       children: wineController.wines
//                           .map((wine) => WineBox(wine: wine))
//                           .toList(),
//                     )),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final WineController wineController = Get.put(WineController());

//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const Header(),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Wine',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // Handle "view all" action
//                         },
//                         child: const Text(
//                           'view all',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Obx(() => Column(
//                       children: wineController.filteredWines
//                           .map((wine) => WineBox(wine: wine))
//                           .toList(),
//                     )),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final WineController wineController = Get.put(WineController());

    return Scaffold(
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Header(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Wine',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle "view all" action
                        },
                        child: const Text(
                          'view all',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() => Column(
                      children: wineController.filteredWines
                          .map((wine) => Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15.0), // Add spacing here
                                child: WineBox(wine: wine),
                              ))
                          .toList(),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
