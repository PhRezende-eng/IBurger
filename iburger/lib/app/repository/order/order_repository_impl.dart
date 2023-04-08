import 'package:iburger/app/core/rest_client/custom_dio.dart';
import 'package:iburger/app/dto/order_product_dto.dart';
import 'package:iburger/app/models/product_model.dart';
import 'package:iburger/app/repository/order/order_respository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio _dio;
  OrderRepositoryImpl(this._dio);
  @override
  Future<OrderProductDto> sendOrderBag(OrderProductDto orderBag) async {
    return OrderProductDto(
      1,
      ProductModel(
        description: '1',
        id: 2,
        image: '',
        name: 'sdf',
        price: 2.5,
      ),
    );
  }
}
