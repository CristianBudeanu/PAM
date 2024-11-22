import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/wine_model.dart';

class WineLocalDataSource {
  Future<List<WineModel>> loadWines() async {
    final String response = await rootBundle.loadString("lib/assets/v3.json");
    final data = json.decode(response);

    return (data['carousel'] as List)
        .map((json) => WineModel.fromJson(json))
        .toList();
  }

  Future<List<String>> loadFilters() async {
    final String response = await rootBundle.loadString("lib/assets/v3.json");
    final data = json.decode(response);

    return (data['wines_by'] as List)
        .map((filter) => filter['name'] as String)
        .toList();
  }
}
