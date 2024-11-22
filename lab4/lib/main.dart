import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab2/presentation/views/home.dart';

import 'data/datasource/wine_local_datasource.dart';
import 'data/repositories/wine_repository_impl.dart';
import 'presentation/controllers/wine_controller.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 211, 217, 229),
      ),
      initialBinding: BindingsBuilder(() {
        // Initialize dependencies using GetX Dependency Injection
        final dataSource = WineLocalDataSource();
        final repository = WineRepository(dataSource);
        Get.put(WineController(repository));
      }),
      home: const HomePage(),
    );
  }
}
