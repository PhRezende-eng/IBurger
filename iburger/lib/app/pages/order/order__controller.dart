import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iburger/app/dto/order_product_dto.dart';
import 'package:iburger/app/pages/order/order_state.dart';
import 'package:iburger/app/repository/order/order_repository_impl.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepositoryImpl _orderRepositoryImpl;
  OrderController(this._orderRepositoryImpl)
      : super(const OrderState.initial());

  void loadedOrderBag(List<OrderProductDto> products) {
    emit(state.copyWith(orderProducts: products));
  }
}
