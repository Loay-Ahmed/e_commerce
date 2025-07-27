class CartsModel {
  String? id;
  String? forUser;
  int? quantity;
  DateTime? createdAt;
  bool? isInCart;
  String? forProduct;

  CartsModel({
    this.id,
    this.forUser,
    this.quantity,
    this.createdAt,
    this.isInCart,
    this.forProduct,
  });

  factory CartsModel.fromJson(Map<String, dynamic> json) => CartsModel(
    id: json['id'] as String?,
    forUser: json['for_user'] as String?,
    quantity: json['quantity'] as int?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    isInCart: json['is_in_cart'] as bool?,
    forProduct: json['for_product'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'for_user': forUser,
    'quantity': quantity,
    'created_at': createdAt?.toIso8601String(),
    'is_in_cart': isInCart,
    'for_product': forProduct,
  };
}
