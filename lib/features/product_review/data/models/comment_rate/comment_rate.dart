import 'package:e_commerce/features/my_profile/data/model/user_model.dart';

class CommentRateModel {
  String? id;
  DateTime? createdAt;
  String? comment;
  String? forUser;
  String? forProduct;
  int? rate;
  UserModel? users;

  CommentRateModel({
    this.id,
    this.createdAt,
    this.comment,
    this.forUser,
    this.forProduct,
    this.rate,
    this.users,
  });

  factory CommentRateModel.fromJson(Map<String, dynamic> json) =>
      CommentRateModel(
        id: json['id'] as String?,
        createdAt:
            json['created_at'] == null
                ? null
                : DateTime.parse(json['created_at'] as String),
        comment: json['comment'] as String?,
        forUser: json['for_user'] as String?,
        forProduct: json['for_product'] as String?,
        rate: json['rate'] as int?,
        users:
            json['users'] == null
                ? null
                : UserModel.fromJson(json['users'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
    // 'id': id,
    // 'created_at': createdAt?.toIso8601String(),
    'comment': comment,
    'for_user': forUser,
    'for_product': forProduct,
    'rate': rate,
    // 'users': users?.toJson(),
  };
}
