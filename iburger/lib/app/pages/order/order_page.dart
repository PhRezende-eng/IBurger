import 'package:flutter/material.dart';
import 'package:iburger/app/core/extensions/formatter_extension.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/core/ui/widgets/delivery_button.dart';
import 'package:iburger/app/dto/order_product_dto.dart';
import 'package:iburger/app/pages/order/widgets/order_field.dart';
import 'package:iburger/app/pages/order/widgets/order_product_tile.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatelessWidget {
  final List<OrderProductDto> bag;

  const OrderPage({super.key, required this.bag});

  @override
  Widget build(BuildContext context) {
    var totalPrice = bag.fold(
        0.0,
        (previousPrice, currentProduct) =>
            previousPrice + currentProduct.amount);

    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do pedido',
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 16),
                      ),
                      Text(
                        totalPrice.currencyPTBR,
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 20),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Divider(color: context.colors.borderSideButton),
                OrderField(
                  controller: TextEditingController(),
                  hintText: 'Endereço de entrega',
                  title: 'Digite um endereço',
                  validatorless: Validatorless.required('m'),
                ),
                const SizedBox(height: 10),
                OrderField(
                  controller: TextEditingController(),
                  hintText: 'CPF',
                  title: 'Digite o CPF',
                  validatorless: Validatorless.required('m'),
                ),
                const SizedBox(height: 10),
                //TODO: Payment methods
              ],
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Divider(
                  color: context.colors.borderSideButton,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: DeliveryButton(
                    height: 48,
                    onPressed: () {},
                    child: const Text('Finalizar pedido'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
