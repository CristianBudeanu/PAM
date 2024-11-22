import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:lab2/controllers/wine_controller.dart';
import 'package:lab2/home.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Using GetMaterialApp to enable GetX features
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 211, 217, 229),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(WineController()); // Initialize the WineController with Get.put
      }),
      home: const HomePage(),
    );
  }
}

