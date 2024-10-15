import 'package:flutter/material.dart';
import 'package:lab2/ImageCarousel.dart';
import 'package:lab2/WineBox.dart';
import 'package:lab2/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Header(),
                    ImageCarousel(),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wine',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'view all',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const WineBox(
                      available: true,
                      wineName: "Uneori",
                      wineImage: "/lib/assets/wine1.jpg",
                      wineType: "Dulce",
                      wineDescription:
                          "Wine blue, red yellow and so on, very big text.",
                      wineRegionImage: "/lib/assets/franceIcon.png",
                      winePrice: "22,32",
                      wineCapacity: "750",
                      wineScore: "9.1",
                    ),
                    SizedBox(height: 15),
                    const WineBox(
                      available: false,
                      wineName: "Uneori",
                      wineImage: "/lib/assets/wine1.jpg",
                      wineType: "Dulce",
                      wineDescription:
                          "Wine blue, red yellow and so on, very big text.",
                      wineRegionImage: "/lib/assets/franceIcon.png",
                      winePrice: "22,32",
                      wineCapacity: "750",
                      wineScore: "9.1",
                    ),
                    SizedBox(height: 15),
                    const WineBox(
                      available: false,
                      wineName: "Uneori",
                      wineImage: "/lib/assets/wine1.jpg",
                      wineType: "Dulce",
                      wineDescription:
                          "Wine blue, red yellow and so on, very big text.",
                      wineRegionImage: "/lib/assets/franceIcon.png",
                      winePrice: "22,32",
                      wineCapacity: "750",
                      wineScore: "9.1",
                    )
                  ],
                )
              ],
            )));
  }
}
