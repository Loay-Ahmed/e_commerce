class FavoritesModel {
  String? id;
  String? forUser;
  DateTime? createdAt;
  String? forProduct;
  bool? isFavorite;

  FavoritesModel({
    this.id,
    this.forUser,
    this.createdAt,
    this.forProduct,
    this.isFavorite,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      id: json['id'] as String?,
      forUser: json['for_user'] as String?,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      forProduct: json['for_product'] as String?,
      isFavorite: json['is_favorite'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    // 'id': id,
    'for_user': forUser,
    // 'created_at': createdAt?.toIso8601String(),
    'for_product': forProduct,
    'is_favorite': isFavorite,
  };
}
