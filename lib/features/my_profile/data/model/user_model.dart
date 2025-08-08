class UserModel {
  String? userId;
  DateTime? createdAt;
  String? name;
  String? email;
  String? image;
  dynamic address;

  UserModel({
    this.userId,
    this.createdAt,
    this.name,
    this.email,
    this.image,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json['user_id'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    name: json['name'] as String?,
    email: json['email'] as String?,
    image: json['image'] as String?,
    address: json['address'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'created_at': createdAt?.toIso8601String(),
    'name': name,
    'email': email,
    'image': image,
    'address': address,
  };
}
