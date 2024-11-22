import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab2/models/wine.dart';

class WineController extends GetxController {
  var wines = <Wine>[].obs;
  var filters = <String>[].obs;
  var isFavorited = false.obs;
  var selectedFilter = ''.obs;
  var searchText = ''.obs;

  RxList<Wine> filteredWines = <Wine>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();

    debounce(searchText, (_) => applyFilter(),
        time: const Duration(milliseconds: 300));
    ever(selectedFilter, (_) => applyFilter());
  }

  Future<void> loadData() async {
    final String response = await rootBundle.loadString("lib/assets/v3.json");
    final data = json.decode(response);

    // Load wines
    List<Wine> loadedWines =
        (data['carousel'] as List).map((json) => Wine.fromJson(json)).toList();
    wines.assignAll(loadedWines);

    // Load filters
    List<String> loadedFilters = (data['wines_by'] as List)
        .map((filter) => filter['name'] as String)
        .toList();
    filters.assignAll(loadedFilters);

    if (filters.isNotEmpty) {
      selectedFilter.value = filters[0];
    }
    applyFilter();
  }

  bool isWineAvailable(Wine wine) {
    return true;
  }

  void toggleFavorite() {
    isFavorited.value = !isFavorited.value;
  }

  void selectFilter(String filter) {
    selectedFilter.value = filter;
  }

  void applyFilter() {
    String query = searchText.value.toLowerCase();

    if (query.isEmpty) {
      filteredWines.assignAll(wines); // Show all wines if search is empty
    } else {
      filteredWines.assignAll(
        wines.where((wine) {
          switch (selectedFilter.value.toLowerCase()) {
            case 'type':
              return wine.type.toLowerCase().contains(query);
            case 'countries':
              return wine.country.toLowerCase().contains(query);
            default:
              return false;
          }
        }).toList(),
      );
    }
    print("Selected Filter ${selectedFilter.value}");
    print("Filtered wines count: ${filteredWines.length}"); // Debugging
  }
}
