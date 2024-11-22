import '../../domain/entities/wine.dart';

class WineModel extends Wine {
  WineModel({
    required String name,
    required String image,
    required int criticScore,
    required String bottleSize,
    required double priceUsd,
    required String type,
    required String country,
    required String city,
  }) : super(
          name: name,
          image: image,
          criticScore: criticScore,
          bottleSize: bottleSize,
          priceUsd: priceUsd,
          type: type,
          country: country,
          city: city,
        );

  factory WineModel.fromJson(Map<String, dynamic> json) {
    return WineModel(
      name: json['name'],
      image: json['image'],
      criticScore: json['critic_score'],
      bottleSize: json['bottle_size'],
      priceUsd: json['price_usd'].toDouble(),
      type: json['type'],
      country: json['from']['country'],
      city: json['from']['city'],
    );
  }
}
