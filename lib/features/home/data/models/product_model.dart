import 'carts_model.dart';
import 'favorites_model.dart';

class ProductModel {
  String? id;
  DateTime? createdAt;
  String? name;
  int? price;
  int? quantity;
  String? description;
  double? expireDate;
  int? calories;
  int? organicPercentage;
  int? reviewsNumber;
  double? reviewsRate;
  String? imageUrl;
  String? oldPrice;
  String? discount;
  List<FavoritesModel>? favoritesTable;
  List<CartsModel>? cartsModel;

  ProductModel({
    this.id,
    this.createdAt,
    this.name,
    this.price,
    this.quantity,
    this.description,
    this.expireDate,
    this.calories,
    this.organicPercentage,
    this.reviewsNumber,
    this.reviewsRate,
    this.imageUrl,
    this.oldPrice,
    this.discount,
    this.favoritesTable,
    this.cartsModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    name: json['name'] as String?,
    price: json['price'] as int?,
    quantity: json['quantity'] as int?,
    description: json['description'] as String?,
    expireDate: (json['expire_date'] as num?)?.toDouble(),
    calories: json['calories'] as int?,
    organicPercentage: json['organic_percentage'] as int?,
    reviewsNumber: json['reviews_number'] as int?,
    reviewsRate: (json['reviews_rate'] as num?)?.toDouble(),
    imageUrl: json['image_url'] as String?,
    oldPrice: json['old_price'] as String?,
    discount: json['discount'] as String?,
    favoritesTable:
        (json['favorites_table'] as List<dynamic>?)
            ?.map((e) => FavoritesModel.fromJson(e as Map<String, dynamic>))
            .toList(),
    cartsModel:
        (json['carts_table'] as List<dynamic>?)
            ?.map((e) => CartsModel.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt?.toIso8601String(),
    'name': name,
    'price': price,
    'quantity': quantity,
    'description': description,
    'expire_date': expireDate,
    'calories': calories,
    'organic_percentage': organicPercentage,
    'reviews_number': reviewsNumber,
    'reviews_rate': reviewsRate,
    'image_url': imageUrl,
    'old_price': oldPrice,
    'discount': discount,
    'favorites_table': favoritesTable?.map((e) => e.toJson()).toList(),
    'carts_table': cartsModel?.map((e) => e.toJson()).toList(),
  };
}
