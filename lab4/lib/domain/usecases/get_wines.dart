import '../entities/wine.dart';

class GetWines {
  final List<Wine> wines;

  GetWines(this.wines);

  List<Wine> execute({
    required String filter,
    required String query,
  }) {
    query = query.toLowerCase();

    if (query.isEmpty) return wines;

    return wines.where((wine) {
      switch (filter.toLowerCase()) {
        case 'type':
          return wine.type.toLowerCase().contains(query);
        case 'countries':
          return wine.country.toLowerCase().contains(query);
        default:
          return false;
      }
    }).toList();
  }
}
