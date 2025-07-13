// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String name;
  final String image;
  final int price;
  final int quantity;
  final double rating;
  final int reviews;
  final String description;
  final int calories;
  final double organicPercent;
  final String endsAt;
  final bool isFavorite;
  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.calories,
    required this.organicPercent,
    required this.endsAt,
    required this.isFavorite,
  });
}
