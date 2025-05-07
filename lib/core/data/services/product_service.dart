import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product.dart';

class ProductService {
  final storage = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAllProducts() async {
    final res = await storage.collection("products").get();
    return res.docs.map((doc) => doc.data()).toList();
  }

  Future<Map<String, dynamic>> getProductById(int id) async {
    final res = await storage.collection("products").doc(id.toString()).get();
    return res.data() ?? {};
  }

  void addProduct(Product product) async {
    await storage
        .collection("products")
        .doc(product.id.toString())
        .set(product.toJson());
  }

  Future<void> updateProduct(Product product) async {
    await storage
        .collection("products")
        .doc(product.id.toString())
        .set(product.toJson());
  }

  Future<void> deleteProduct(Product product) async {
    await storage.collection("products").doc(product.id.toString()).delete();
  }
}
