import '../../domain/entities/wine.dart';
import '../datasource/wine_local_datasource.dart';

class WineRepository {
  final WineLocalDataSource dataSource;

  WineRepository(this.dataSource);

  Future<List<Wine>> fetchWines() async {
    return await dataSource.loadWines();
  }

  Future<List<String>> fetchFilters() async {
    return await dataSource.loadFilters();
  }
}
