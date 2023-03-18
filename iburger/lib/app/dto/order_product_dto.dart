import 'package:iburger/app/models/product_model.dart';

class OrderProductDto {
  final ProductModel product;
  final int amount;
  OrderProductDto(this.amount, this.product);

  double get totalPrice => amount * product.price;

  //TODO: put here orderTotalPrice changing the structure
}
