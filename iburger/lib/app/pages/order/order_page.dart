import 'package:flutter/material.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/dto/order_product_dto.dart';
import 'package:iburger/app/pages/order/widgets/order_product_tile.dart';

class OrderPage extends StatelessWidget {
  final List<OrderProductDto> bag;

  const OrderPage({super.key, required this.bag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Text(
                    'Carrinho',
                    style: context.textStyles.textTitle,
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/trashRegular.png'),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: bag.length,
              (context, index) {
                return Column(
                  children: [
                    OrderProductTile(index, bag[index]),
                    Divider(color: context.colors.borderSideButton),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
