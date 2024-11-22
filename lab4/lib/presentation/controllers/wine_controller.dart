import 'package:get/get.dart';
import '../../domain/entities/wine.dart';
import '../../domain/usecases/get_wines.dart';
import '../../data/repositories/wine_repository_impl.dart';
import '../../domain/usecases/toggle_favourite.dart';

class WineController extends GetxController {
  final WineRepository repository;

  WineController(this.repository);

  var wines = <Wine>[].obs; // List of all wines
  var filters = <String>[].obs; // List of filters
  var selectedFilter = ''.obs; // Current selected filter
  var searchText = ''.obs; // Search query text
  var filteredWines = <Wine>[].obs; // List of wines filtered by search or filter
  var isFavorited = false.obs; // Favorite state

  final _getWines = GetWines([]); // Use case for filtering wines
  final _toggleFavorite = ToggleFavorite(); // Use case for toggling favorites

  @override
  void onInit() {
    super.onInit();
    loadData();
    debounce(searchText, (_) => applyFilter(), time: const Duration(milliseconds: 300));
    ever(selectedFilter, (_) => applyFilter());
  }

  // Load data from the repository
  Future<void> loadData() async {
    wines.assignAll(await repository.fetchWines());
    filters.assignAll(await repository.fetchFilters());

    if (filters.isNotEmpty) {
      selectedFilter.value = filters[0]; // Default to the first filter
    }
    applyFilter();
  }

  // Update the selected filter
  void selectFilter(String filter) {
    selectedFilter.value = filter;
  }

  // Toggle favorite status
  void toggleFavorite() {
    isFavorited.value = _toggleFavorite.execute(isFavorited.value);
  }

  // Apply filter and search to wines
  void applyFilter() {
    final getWines = GetWines(wines);
    filteredWines.assignAll(
      getWines.execute(
        filter: selectedFilter.value,
        query: searchText.value,
      ),
    );
  }
}
