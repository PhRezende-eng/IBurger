import 'package:flutter/widgets.dart';
import 'package:iburger/app/core/extensions/formatter_extension.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/core/ui/widgets/delivery_increment_decrement_buttom.dart';
import 'package:iburger/app/dto/order_product_dto.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;
  const OrderProductTile(this.index, this.orderProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              orderProduct.product.image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderProduct.product.name,
                  style: context.textStyles.textRegular.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      orderProduct.product.price.currencyPTBR,
                      style: context.textStyles.textMedium.copyWith(
                        fontSize: 14,
                        color: context.colors.secondary,
                      ),
                    ),
                    DeliveryIncrementDecrementButtom(
                      amount: orderProduct.amount,
                      incrementTap: () {},
                      decrementTap: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
