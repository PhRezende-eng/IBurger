import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iburger/app/core/extensions/formatter_extension.dart';
import 'package:iburger/app/core/ui/base_state/base_state.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/core/ui/widgets/delivery_button.dart';
import 'package:iburger/app/core/ui/widgets/delivery_increment_decrement_buttom.dart';
import 'package:iburger/app/dto/order_product_dto.dart';
import 'package:iburger/app/models/product_model.dart';
import 'package:iburger/app/pages/product_detail/product_detail_controller.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final OrderProductDto? order;
  const ProductDetailPage({super.key, required this.product, this.order});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  void initState() {
    super.initState();
    final amount = widget.order?.amount ?? 1;
    controller.initial(amount, widget.order != null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Hero(
              tag: widget.product.id,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: widget.product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Hero(
              tag: '${widget.product.id}${widget.product.name}',
              child: Material(
                color: context.colors.whiteColor,
                child: Text(
                  widget.product.name,
                  style:
                      context.textStyles.textExtraBold.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Hero(
                tag: '${widget.product.id}${widget.product.description}',
                child: Material(
                  color: context.colors.whiteColor,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.product.description,
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) =>
                        DeliveryIncrementDecrementButtom(
                      amount: amount,
                      incrementTap: controller.increment,
                      decrementTap: controller.decrement,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) => DeliveryButton(
                      color: amount == 0 ? context.colors.errorColor : null,
                      onPressed: () {
                        amount == 0
                            ? _showConfirmDelete(amount)
                            : _popAndSendTheOrder(amount);
                      },
                      child: Visibility(
                        visible: amount > 0,
                        replacement: const Text("Excluir produto"),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Adicionar"),
                            const SizedBox(width: 10),
                            Text((widget.product.price * amount).currencyPTBR),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showConfirmDelete(int amount) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Deseja excluir o produto?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancelar',
              style: TextStyle(
                color: context.colors.errorColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _popAndSendTheOrder(amount);
            },
            child: Text(
              'Confirmar',
              style: TextStyle(
                color: context.colors.successColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _popAndSendTheOrder(int amount) {
    Navigator.of(context).pop(
      OrderProductDto(
        amount,
        widget.product,
      ),
    );
  }
}
