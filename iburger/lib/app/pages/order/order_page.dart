import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/dto/order_product_dto.dart';

class OrderPage extends StatelessWidget {
  final List<OrderProductDto> bag;

  const OrderPage({super.key, required this.bag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Container(),
    );
  }
}
