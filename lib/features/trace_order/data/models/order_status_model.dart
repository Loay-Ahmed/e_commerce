class OrderStatusModel {
  final String title;
  final String date;
  final bool isCircleCompleted;
  final bool isLineCompleted;
  final bool isFirst;
  final bool isLast;

  OrderStatusModel({
    required this.title,
    required this.date,
    required this.isCircleCompleted,
    required this.isLineCompleted,
    this.isFirst = false,
    this.isLast = false,
  });
}
