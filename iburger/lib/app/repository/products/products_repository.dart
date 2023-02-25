import 'package:iburger/app/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> loadProducts();
}
