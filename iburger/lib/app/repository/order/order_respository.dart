import 'package:iburger/app/dto/order_product_dto.dart';

abstract class OrderRepository {
  Future<OrderProductDto> sendOrderBag(OrderProductDto orderBag);
}
