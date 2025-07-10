class Product {
  late final int id;
  late final String productName;
  late final String imageUrl;
  late final double price;
  late final int quantity;
  late final double rating;
  late final int calories;
  late final DateTime expireDate;
  late final double organicPercentage;

  static int counter = 0;

  Product(
      this.productName,
    this.price,
    this.imageUrl,
    this.quantity,
    this.rating,
    this.calories,
    this.expireDate,
    this.organicPercentage,
  ) {
    id = counter++;
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    productName = json["productName"];
    price = json["price"];
    imageUrl = json["imageUrl"];
    quantity = json["quantity"];
    rating = json["rating"];
    calories = json["calories"];
    expireDate = json["expireDate"];
    organicPercentage = json["organicPercentage"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "productName": productName,
      "price": price,
      "imageUrl": imageUrl,
      "quantity": quantity,
      "rating": rating,
      "calories": calories,
      "expireDate": expireDate,
      "organicPercentage": organicPercentage,
    };
  }
}
