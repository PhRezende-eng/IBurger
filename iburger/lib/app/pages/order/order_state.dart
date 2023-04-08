import 'package:equatable/equatable.dart';
import 'package:iburger/app/dto/order_product_dto.dart';

enum OrderStatus {
  initial,
  loaded,
}

class OrderState extends Equatable {
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;
  const OrderState({required this.status, required this.orderProducts});

  const OrderState.initial()
      : status = OrderStatus.initial,
        orderProducts = const [];

  @override
  List<Object?> get props => [status];

  OrderState copyWith(
      {OrderStatus? status, List<OrderProductDto>? orderProducts}) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
    );
  }
}
