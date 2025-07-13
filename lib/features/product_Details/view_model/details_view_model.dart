import '../../../core/data/model/product.dart';
import '../../../core/data/services/product_service.dart';

class DetailsViewModel {
  final ProductService _service = ProductService();

  Future<void> saveProduct(Product product) async {
    try {
      await _service.addProduct(product);
    } catch (e) {
      print("Error saving product: $e");
    }
  }
}
