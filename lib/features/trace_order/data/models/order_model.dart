class OrderModel {
  String? id;
  DateTime? createdAt;
  String? orderNumber;
  String? orderDate;
  String? orderPrice;
  bool? orderTracking;
  String? orderTrackingDate;
  bool? orderAccepted;
  String? orderAcceptedDate;
  bool? orderShipped;
  String? orderShippedDate;
  bool? orderOutForDelivery;
  String? orderOutForDeliveryDate;
  bool? orderDelivered;
  String? orderDeliveredDate;
  String? forUser;

  OrderModel({
    this.id,
    this.createdAt,
    this.orderNumber,
    this.orderDate,
    this.orderPrice,
    this.orderTracking,
    this.orderTrackingDate,
    this.orderAccepted,
    this.orderAcceptedDate,
    this.orderShipped,
    this.orderShippedDate,
    this.orderOutForDelivery,
    this.orderOutForDeliveryDate,
    this.orderDelivered,
    this.orderDeliveredDate,
    this.forUser,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json['id'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    orderNumber: json['order_number'] as String?,
    orderDate: json['order_date'] as String?,
    orderPrice: json['order_price'] as String?,
    orderTracking: json['order_tracking'] as bool?,
    orderTrackingDate: json['order_tracking_date'] as String?,
    orderAccepted: json['order_accepted'] as bool?,
    orderAcceptedDate: json['order_accepted_date'] as String?,
    orderShipped: json['order_shipped'] as bool?,
    orderShippedDate: json['order_shipped_date'] as String?,
    orderOutForDelivery: json['order_out_for_delivery'] as bool?,
    orderOutForDeliveryDate: json['order_out_for_delivery_date'] as String?,
    orderDelivered: json['order_delivered'] as bool?,
    orderDeliveredDate: json['order_delivered_date'] as String?,
    forUser: json['for_user'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt?.toIso8601String(),
    'order_number': orderNumber,
    'order_date': orderDate,
    'order_price': orderPrice,
    'order_tracking': orderTracking,
    'order_tracking_date': orderTrackingDate,
    'order_accepted': orderAccepted,
    'order_accepted_date': orderAcceptedDate,
    'order_shipped': orderShipped,
    'order_shipped_date': orderShippedDate,
    'order_out_for_delivery': orderOutForDelivery,
    'order_out_for_delivery_date': orderOutForDeliveryDate,
    'order_delivered': orderDelivered,
    'order_delivered_date': orderDeliveredDate,
    'for_user': forUser,
  };
}
