import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab2/controllers/wine_controller.dart';
import 'package:lab2/models/wine.dart';

class WineBox extends StatelessWidget {
  final Wine wine;

  const WineBox({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    final WineController wineController = Get.find();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    wine.image,
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: wineController.isWineAvailable(wine) ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          wineController.isWineAvailable(wine) ? "Available" : "Unavailable",
                          style: TextStyle(
                            color: wineController.isWineAvailable(wine) ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        wine.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        wine.type,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        wine.city,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => GestureDetector(
                              onTap: () => wineController.toggleFavorite(),
                              child: Row(
                                children: [
                                  Icon(
                                    wineController.isFavorited.value ? Icons.favorite : Icons.favorite_border,
                                    color: wineController.isFavorited.value ? Colors.red : Colors.black,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    wineController.isFavorited.value ? "Added" : "Favourite",
                                    style: TextStyle(
                                      color: wineController.isFavorited.value ? Colors.red : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 8),
                        Text(
                          "Critics’ Scores: ${wine.criticScore} / 100",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "€ ${wine.priceUsd.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Bottle (${wine.bottleSize})",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

