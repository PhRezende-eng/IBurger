import 'package:flutter/material.dart';
import 'package:iburger/app/core/extensions/formatter_extension.dart';
import 'package:iburger/app/core/ui/styles/colors_app.dart';
import 'package:iburger/app/core/ui/styles/text_styles.dart';
import 'package:iburger/app/core/ui/widgets/delivery_appbar.dart';
import 'package:iburger/app/core/ui/widgets/delivery_button.dart';
import 'package:iburger/app/core/ui/widgets/delivery_increment_decrement_buttom.dart';
import 'package:iburger/app/models/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  var amount = 1;
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    ProductModel product = arg['product'];
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Hero(
              tag: product.id,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Hero(
              tag: '${product.id}${product.name}',
              child: Material(
                color: context.colors.whiteColor,
                child: Text(
                  product.name,
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
                tag: '${product.id}${product.description}',
                child: Material(
                  color: context.colors.whiteColor,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        product.description,
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
                  child: DeliveryIncrementDecrementButtom(
                    amount: amount,
                    incrementTap: () {
                      amount++;
                      setState(() {});
                    },
                    decrementTap: () {
                      if (amount > 1) {
                        amount--;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DeliveryButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Adicionar"),
                        const SizedBox(width: 10),
                        Text(product.price.currencyPTBR),
                      ],
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
}
